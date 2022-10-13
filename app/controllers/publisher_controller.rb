class PublisherController < ApplicationController
  def index
    @publishers = Publisher.order(created_at: :asc).page(params[:page])
  end

  def show
    @Publisher = Publisher.find(params[:id])
  end
end
