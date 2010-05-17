#This class is outside code's main interface into the ABingo A/B testing framework.
#Unless you're fiddling with implementation details, it is the only one you need worry about.

#Usage of ABingo, including practical hints, is covered at http://www.bingocardcreator.com/abingo

class Abingo

  @@VERSION = "1.0.0"
  @@MAJOR_VERSION = "1.0"
  cattr_reader :VERSION
  cattr_reader :MAJOR_VERSION

  #Not strictly necessary, but eh, as long as I'm here.
  cattr_accessor :salt
  @@salt = "Not really necessary."

  @@options ||= {}
  cattr_accessor :options

  #Defined options:
  # :enable_specification  => if true, allow params[test_name] to override the calculated value for a test.

  #ABingo stores whether a particular user has participated in a particular
  #experiment yet, and if so whether they converted, in the cache.
  #
  #It is STRONGLY recommended that you use a MemcacheStore for this.
  #If you'd like to persist this through a system restart or the like, you can
  #look into memcachedb, which speaks the memcached protocol.  From the perspective
  #of Rails it is just another MemcachedStore.
  #
  #You can overwrite Abingo's cache instance, if you would like it to not share
  #your generic Rails cache.
  cattr_writer :cache

  def self.cache
    @@cache || Rails.cache
  end

  #This method gives a unique identity to a user.  It can be absolutely anything
  #you want, as long as it is consistent.
  #
  #We use the identity to determine, deterministically, which alternative a user sees.
  #This means that if you use Abingo.identify_user on someone at login, they will
  #always see the same alternative for a particular test which is past the login
  #screen.  For details and usage notes, see the docs.
  def self.identity=(new_identity)
    @@identity = new_identity.to_s
  end

  def self.identity
    @@identity ||= rand(10 ** 10).to_i.to_s
  end

  #A simple convenience method for doing an A/B test.  Returns true or false.
  #If you pass it a block, it will bind the choice to the variable given to the block.
  def self.flip(test_name)
    if block_given?
      yield(self.test(test_name, [true, false]))
    else
      self.test(test_name, [true, false])
    end
  end

  #This is the meat of A/Bingo.
  #options accepts
  #  :multiple_participation (true or false)
  #  :conversion  name of conversion to listen for  (alias: conversion_name)
  def self.test(test_name, alternatives, options = {})

    short_circuit = Abingo.cache.read("Abingo::Experiment::short_circuit(#{test_name})".gsub(" ", "_"))
    unless short_circuit.nil?
      return short_circuit  #Test has been stopped, pick canonical alternative.
    end
    
    unless Abingo::Experiment.exists?(test_name)
      lock_key = test_name.gsub(" ", "_")
      if Abingo.cache.exist?(lock_key)
        while Abingo.cache.exist?(lock_key)
          sleep(0.1)
        end
        break
      end
      Abingo.cache.write(lock_key, 1, :expires_in => 5.seconds)
      conversion_name = options[:conversion] || options[:conversion_name]
      Abingo::Experiment.start_experiment!(test_name, self.parse_alternatives(alternatives), conversion_name)
      Abingo.cache.delete(lock_key)
    end

    choice = self.find_alternative_for_user(test_name, alternatives)
    participating_tests = Abingo.cache.read("Abingo::participating_tests::#{Abingo.identity}") || []
    
    #Set this user to participate in this experiment, and increment participants count.
    if options[:multiple_participation] || !(participating_tests.include?(test_name))
      unless participating_tests.include?(test_name)
        participating_tests = participating_tests + [test_name]
        Abingo.cache.write("Abingo::participating_tests::#{Abingo.identity}", participating_tests)
      end
      Abingo::Alternative.score_participation(test_name)
    end

    if block_given?
      yield(choice)
    else
      choice
    end
  end


  #Scores conversions for tests.
  #test_name_or_array supports three types of input:
  #
  #A conversion name: scores a conversion for any test the user is participating in which
  #  is listening to the specified conversion.
  #
  #A test name: scores a conversion for the named test if the user is participating in it.
  #
  #An array of either of the above: for each element of the array, process as above.
  #
  #nil: score a conversion for every test the u
  def Abingo.bingo!(name = nil, options = {})
    if name.kind_of? Array
      name.map do |single_test|
        self.bingo!(single_test, options)
      end
    else
      if name.nil?
        #Score all participating tests
        participating_tests = Abingo.cache.read("Abingo::participating_tests::#{Abingo.identity}") || []
        participating_tests.each do |participating_test|
          self.bingo!(participating_test, options)
        end
      else #Could be a test name or conversion name.
        conversion_name = name.gsub(" ", "_")
        tests_listening_to_conversion = Abingo.cache.read("Abingo::tests_listening_to_conversion#{conversion_name}")
        if tests_listening_to_conversion
          if tests_listening_to_conversion.size > 1
            tests_listening_to_conversion.map do |individual_test|
              self.score_conversion!(individual_test.to_s)
            end
          elsif tests_listening_to_conversion.size == 1
            test_name_str = tests_listening_to_conversion.first.to_s
            self.score_conversion!(test_name_str)
          end
        else
          #No tests listening for this conversion.  Assume it is just a test name.
          test_name_str = name.to_s
          self.score_conversion!(test_name_str)
        end
      end
    end
  end

  protected

  #For programmer convenience, we allow you to specify what the alternatives for
  #an experiment are in a few ways.  Thus, we need to actually be able to handle
  #all of them.  We fire this parser very infrequently (once per test, typically)
  #so it can be as complicated as we want.
  #   Integer => a number 1 through N
  #   Range   => a number within the range
  #   Array   => an element of the array.
  #   Hash    => assumes a hash of something to int.  We pick one of the 
  #              somethings, weighted accorded to the ints provided.  e.g.
  #              {:a => 2, :b => 3} produces :a 40% of the time, :b 60%.
  #
  #Alternatives are always represented internally as an array.
  def self.parse_alternatives(alternatives)
    if alternatives.kind_of? Array
      return alternatives
    elsif alternatives.kind_of? Integer
      return (1..alternatives).to_a
    elsif alternatives.kind_of? Range
      return alternatives.to_a
    elsif alternatives.kind_of? Hash
      alternatives_array = []
      alternatives.each do |key, value|
        if value.kind_of? Integer
          alternatives_array += [key] * value
        else
          raise "You gave a hash with #{key} => #{value} as an element.  The value must be an integral weight."
        end
      end
      return alternatives_array
    else
      raise "I don't know how to turn [#{alternatives}] into an array of alternatives."
    end
  end

  def self.retrieve_alternatives(test_name, alternatives)
    cache_key = "Abingo::Experiment::#{test_name}::alternatives".gsub(" ","_")
    alternative_array = self.cache.fetch(cache_key) do
      self.parse_alternatives(alternatives)
    end
    alternative_array
  end

  def self.find_alternative_for_user(test_name, alternatives)
    alternatives_array = retrieve_alternatives(test_name, alternatives)
    alternatives_array[self.modulo_choice(test_name, alternatives_array.size)]
  end

  #Quickly determines what alternative to show a given user.  Given a test name
  #and their identity, we hash them together (which, for MD5, provably introduces
  #enough entropy that we don't care) otherwise
  def self.modulo_choice(test_name, choices_count)
    Digest::MD5.hexdigest(Abingo.salt.to_s + test_name + self.identity.to_s).to_i(16) % choices_count
  end

  def self.score_conversion!(test_name)
    test_name.gsub!(" ", "_")
    participating_tests = Abingo.cache.read("Abingo::participating_tests::#{Abingo.identity}") || []
    if options[:assume_participation] || participating_tests.include?(test_name)
      cache_key = "Abingo::conversions(#{Abingo.identity},#{test_name}"
      if options[:multiple_conversions] || !Abingo.cache.read(cache_key)
        Abingo::Alternative.score_conversion(test_name)
        if Abingo.cache.exist?(cache_key)
          Abingo.cache.increment(cache_key)
        else
          Abingo.cache.write(cache_key, 1)
        end
      end
    end
  end

end