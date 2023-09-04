class OpensController < ApplicationController
  def index
    @opens = Open.last(10).order(created_at: :desc)
  end
end
