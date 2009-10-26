require 'test_helper'

ActiveRecord::Base.class_eval do
  def self.validates_something_weird(*cols)
    cols.each do |col|
      validates_format_of col, :with => /weird/
    end
  end
  def self.validates_something_selfcontained(*cols)
    cols.each do |col|
      validates_format_of col, :with => /blablabla/
    end
  end
end

require 'validation_reflection'

ActiveRecord::Base.class_eval do
  include ActiveRecordExtensions::ValidationReflection
  ActiveRecordExtensions::ValidationReflection.reflected_validations << :validates_something_weird
  ActiveRecordExtensions::ValidationReflection.reflected_validations << {
    :method => :validates_something_selfcontained,
    :ignore_subvalidations => true
  }
  ActiveRecordExtensions::ValidationReflection.install(self)
end


class ValidationReflectionTest < Test::Unit::TestCase

  class Dummy < ActiveRecord::Base
    class << self
  
      def create_fake_column(name, null = true, limit = nil)
        sql_type = limit ? "varchar (#{limit})" : nil
        col = ActiveRecord::ConnectionAdapters::Column.new(name, nil, sql_type, null)
        col
      end
  
      def columns
        [
         create_fake_column('col0'),
         create_fake_column('col1'),
         create_fake_column('col2', false, 100),
         create_fake_column('col3'),
         create_fake_column('col4'),
         create_fake_column('col5'),
         create_fake_column('col6'),
         create_fake_column('col7')
        ]
      end
    end
    
    has_one :nothing
    
    validates_presence_of :col1
    validates_length_of :col2, :maximum => 100
    validates_format_of :col3, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
    validates_numericality_of :col4, :only_integer => true
    validates_numericality_of :col5, :less_than => 5
    validates_something_weird :col6
    validates_something_selfcontained :col7
  end


  def test_sanity
    assert_equal [], Dummy.reflect_on_validations_for(:col0)
  end

  def test_validates_presence_of_is_reflected
    refls = Dummy.reflect_on_validations_for(:col1)
    assert refls.all? { |r| r.name.to_s == 'col1' }
    assert refls.find { |r| r.macro == :validates_presence_of }
  end

  def test_string_limit_is_reflected
    refls = Dummy.reflect_on_validations_for(:col2)
    assert refls.any? { |r| r.macro == :validates_length_of && r.options[:maximum] == 100 }
  end

  def test_format_is_reflected
    refls = Dummy.reflect_on_validations_for(:col3)
    assert refls.any? { |r| r.macro == :validates_format_of && r.options[:with] == /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
  end

  def test_numeric_integer_is_reflected
    refls = Dummy.reflect_on_validations_for(:col4)
    assert refls.any? { |r| r.macro == :validates_numericality_of && r.options[:only_integer] }
  end
  
  def test_numeric_is_reflected
    refls = Dummy.reflect_on_validations_for(:col5)
    assert refls.any? { |r| r.macro == :validates_numericality_of }
  end
  
  def test_validation_options_are_reflected
    refls = Dummy.reflect_on_validations_for(:col5)
    refl = refls[0]
    assert_equal 5, refl.options[:less_than]
  end

  def test_custom_validations_are_reflected
    refls = Dummy.reflect_on_validations_for(:col6)
    assert refls.any? { |r| r.macro == :validates_something_weird }
    assert refls.any? { |r| r.macro == :validates_format_of }
  end

  def test_custom_validations_with_options_are_reflected
    refls = Dummy.reflect_on_validations_for(:col7)
    assert refls.any? { |r| r.macro == :validates_something_selfcontained }
  end

  def test_subvalidations_are_reflected
    refls = Dummy.reflect_on_validations_for(:col6)
    assert_equal 2, refls.size
  end

  def test_ignored_subvalidations_are_not_reflected
    refls = Dummy.reflect_on_validations_for(:col7)
    assert_equal 1, refls.size
  end
end
