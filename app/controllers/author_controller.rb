class AuthorController < ApplicationController
  def index
    @authors = Author.order(created_at: :desc).page(params[:page])
  end

  def show
    @author = Author.find(params[:id])
  end
end
