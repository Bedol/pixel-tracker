class OpensController < ApplicationController
  def index
    @opens = Open.order(created_at: :desc).last(10)
  end
end
