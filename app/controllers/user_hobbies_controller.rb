class UserHobbiesController < ApplicationController
  def create
    user = User.find(params[:user_id])
    user.hobbies.append(Hobby.find(params[:hobby]))
    user.save!
    redirect_to user_url(id: params[:user_id])
  end

  def destroy
    user = User.find(params[:user_id])
    user.hobbies.delete(params[:id])
    redirect_to user_url(id: params[:user_id])
  end

  private

  def post_params
    params.require(:hobby).permit(
      :title
    )
  end
end
