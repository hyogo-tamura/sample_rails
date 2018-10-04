class HobbiesController < ApplicationController
  def index
    @hobbies = Hobby.all
    @hobby = Hobby.new
  end

  def show; end

  def create
    if params[:user_id]
      user = User.find(params[:user_id])
      user.hobbies.append(Hobby.find(params[:hobby]))
      user.save!
      redirect_to user_url, id: user.id
    else
      hobby = Hobby.new(post_params)
      hobby.save!
      redirect_to hobbies_url
    end
  end
end

private

def post_params
  params.require(:hobby).permit(
    :title
  )
end
