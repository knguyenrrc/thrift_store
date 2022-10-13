class SubjectController < ApplicationController
  def index
    @subjects = Subject.order(created_at: :asc).page(params[:page])
  end

  def show
    @subject = Subject.find(params[:id])
  end
end
