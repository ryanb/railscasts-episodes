class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(params[:snippet])
    if @snippet.save
      Resque.enqueue(SnippetHighlighter, @snippet.id)
      redirect_to @snippet, :notice => "Successfully created snippet."
    else
      render 'new'
    end
  end

  def show
    @snippet = Snippet.find(params[:id])
  end
end
