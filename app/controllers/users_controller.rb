class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  
  def index
  end

  def show
    @recomend_hobbies = Hobby.all - current_user.hobbies
  end

  def edit

  end

  def update
    hobby = Hobby.find(params[:hobby])
    current_user.hobbies.append(hobby)
    redirect_to user_url, id: current_user.id
  end
end
