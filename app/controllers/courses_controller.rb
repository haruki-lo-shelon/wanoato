class CoursesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    if params[:search] == nil
        @courses= Course.all
      elsif params[:search] == ''
        @courses= Course.all
      else
        #部分検索
        @courses = Course.where("area LIKE ? ",'%' + params[:search] + '%')
      end
  end

  def new
    @course = Course.new
  end
  
  def create
    course = Course.new(course_params)
    
    course.user_id = current_user.id
    
    if course.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
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
  
  def destroy
    course = Course.find(params[:id])
    course.destroy
    redirect_to action: :index
  end

  private
  def course_params
    params.require(:course).permit(:course_name, :area, :feature)
  end
end
