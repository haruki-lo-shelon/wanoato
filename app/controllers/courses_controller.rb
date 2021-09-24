class CoursesController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    if params[:search] != nil && params[:search] != ''
        #部分検索かつ複数検索
        search = params[:search]
        @courses = Course.joins(:user).where("area LIKE ? OR course_name LIKE ?", "%#{search}%", "%#{search}%").order(id: "DESC")
      else
        @courses = Course.all.order(id: "DESC")
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
    
    @comments = @course.comments
    @comment = Comment.new
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
    params.require(:course).permit(:course_name, :area, :feature, :image, :image2, :image3, :image4, :image5 )
  end
end