class CoursesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @courses = Course.joins(:user).where("area LIKE ? OR course_name LIKE ?", "%#{search}%", "%#{search}%").page(params[:page]).per(3)
      else
        @courses = Course.all.page(params[:page]).per(3)
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
