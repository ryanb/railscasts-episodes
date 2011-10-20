class BoomController < ApplicationController
  def index
  end

  def boom
    raise "Oh no Mr. Bill!"
  end
end
