class SubjectController < ApplicationController
  def index
    @subjects = Subject.order(created_at: :asc).page(params[:page])
  end

  def show
    @Subject = Subject.find(params[:id])
  end
end
