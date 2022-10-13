class PublisherController < ApplicationController
  def index
    @publishers = Publisher.order(created_at: :asc).page(params[:page])
  end

  def show
    @publisher = Publisher.find(params[:id])
  end
end
