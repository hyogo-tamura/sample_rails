class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def index; end

  def show
    @recomend_hobbies = Hobby.all - current_user.hobbies
  end

  def edit; end
end
