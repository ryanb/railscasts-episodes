module Uhoh
  class FailuresController < ApplicationController
    def index
      @failures = Failure.all
    end
  end
end
