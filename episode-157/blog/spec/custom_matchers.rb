module CustomMatchers
  class OneMoreThan
    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      @actual = actual
      @actual == @expected+1
    end

    def failure_message
      "expected #{@actual.inspect} to be one more than #{@expected.inspect}"
    end

    def negative_failure_message
      "expected #{@actual.inspect} not to be one more than #{@expected.inspect}"
    end
  end

  def be_one_more_than(expected)
    OneMoreThan.new(expected)
  end
end