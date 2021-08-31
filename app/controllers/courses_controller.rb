class CoursesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
  end

  def edit
  end
  
  def create
    course = Course.new(course_params)
    if course.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :area, :feature)
  end
end
