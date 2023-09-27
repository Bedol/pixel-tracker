class OpensController < ApplicationController
  def index
    @opens = Open.order(created_at: :desc).first(25)
  end
end
