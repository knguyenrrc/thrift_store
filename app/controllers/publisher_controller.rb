class PublisherController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def show
    @Publisher = Publisher.find(params[:id])
  end
end
