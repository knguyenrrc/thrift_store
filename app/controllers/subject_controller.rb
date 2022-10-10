class SubjectController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show
    @Subject = Subject.find(params[:id])
  end
end
