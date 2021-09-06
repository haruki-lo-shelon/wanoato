class LikesController < ApplicationController
  
  def new
    @like = like.new
  end
  
  def create
    like = current_user.likes.create(course_id: params[:course_id]) #user_idとcourse_idの二つを代入
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Like.find_by(course_id: params[:course_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end