class Abingo::Experiment < ActiveRecord::Base
  include Abingo::Statistics
  include Abingo::ConversionRate

  has_many :alternatives, :dependent => :destroy, :class_name => "Abingo::Alternative"
  validates_uniqueness_of :test_name

  def cache_keys
  ["Abingo::Experiment::exists(#{test_name})".gsub(" ", "_"),
    "Abingo::Experiment::#{test_name}::alternatives".gsub(" ","_"),
    "Abingo::Experiment::short_circuit(#{test_name})".gsub(" ", "_")
  ]
  end
  
  def before_destroy
    cache_keys.each do |key|
      Abingo.cache.delete key
    end
    true
  end

  def participants
    alternatives.sum("participants")
  end

  def conversions
    alternatives.sum("conversions")
  end

  def best_alternative
    alternatives.max do |a,b|
      a.conversion_rate <=> b.conversion_rate
    end
  end

  def self.exists?(test_name)
    cache_key = "Abingo::Experiment::exists(#{test_name})".gsub(" ", "_")
    ret = Abingo.cache.fetch(cache_key) do
      count = Abingo::Experiment.count(:conditions => {:test_name => test_name})
      count > 0 ? count : nil
    end
    (!ret.nil?)
  end

  def self.alternatives_for_test(test_name)
    cache_key = "Abingo::#{test_name}::alternatives".gsub(" ","_")
    Abingo.cache.fetch(cache_key) do
      experiment = Abingo::Experiment.find_by_test_name(test_name)
      alternatives_array = Abingo.cache.fetch(cache_key) do
        tmp_array = experiment.alternatives.map do |alt|
          [alt.content, alt.weight]
        end
        tmp_hash = tmp_array.inject({}) {|hash, couplet| hash[couplet[0]] = couplet[1]; hash}
        Abingo.parse_alternatives(tmp_hash)
      end
      alternatives_array
    end
  end

  def self.start_experiment!(test_name, alternatives_array, conversion_name = nil)
    conversion_name ||= test_name
    conversion_name.gsub!(" ", "_")
    cloned_alternatives_array = alternatives_array.clone
    ActiveRecord::Base.transaction do
      experiment = Abingo::Experiment.find_or_create_by_test_name(test_name)
      experiment.alternatives.destroy_all  #Blows away alternatives for pre-existing experiments.
      while (cloned_alternatives_array.size > 0)
        alt = cloned_alternatives_array[0]
        weight = cloned_alternatives_array.size - (cloned_alternatives_array - [alt]).size
        experiment.alternatives.build(:content => alt, :weight => weight,
          :lookup => Abingo::Alternative.calculate_lookup(test_name, alt))
        cloned_alternatives_array -= [alt]
      end
      experiment.status = "Live"
      experiment.save(false)  #Calling the validation here causes problems b/c of transaction.
      Abingo.cache.write("Abingo::Experiment::exists(#{test_name})".gsub(" ", "_"), 1)

      #This might have issues in very, very high concurrency environments...

      tests_listening_to_conversion = Abingo.cache.read("Abingo::tests_listening_to_conversion#{conversion_name}") || []
      tests_listening_to_conversion << test_name unless tests_listening_to_conversion.include? test_name
      Abingo.cache.write("Abingo::tests_listening_to_conversion#{conversion_name}", tests_listening_to_conversion)
      experiment
    end
  end

  def end_experiment!(final_alternative, conversion_name = nil)
    conversion_name ||= test_name
    ActiveRecord::Base.transaction do
      alternatives.each do |alternative|
        alternative.lookup = "Experiment completed.  #{alternative.id}"
        alternative.save!
      end
      update_attribute(:status, "Finished")
      Abingo.cache.write("Abingo::Experiment::short_circuit(#{test_name})".gsub(" ", "_"), final_alternative)
    end
  end

end
