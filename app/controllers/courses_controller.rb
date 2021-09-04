class CoursesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    course = Course.find(params[:id])
    if course.update(course_params)
      redirect_to :action => "show", :id => course.id
    else
      redirect_to :action => "new"
    end
  end
  
  def create
    course = Course.new(course_params)
    if course.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :area, :feature)
  end
end
