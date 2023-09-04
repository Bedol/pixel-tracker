class OpensController < ApplicationController
  def index
    @opens = Open.last(10)
  end
end
