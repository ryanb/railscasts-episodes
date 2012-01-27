class ProcessesController < ApplicationController
  def index
  end

  def list
    render text: `ps -axcr -o 'pid,pcpu,pmem,time,comm'`
  end
end
