class HobbiesController < ApplicationController
  def index
    @hobbies = Hobby.all
    @hobby = Hobby.new
  end

  def show
    @hobby = Hobby.find(params[:id])
  end

  def create
    hobby = Hobby.new(post_params)
    hobby.save!
    redirect_to hobbies_url
  end

  private

  def post_params
    params.require(:hobby).permit(
      :title
    )
  end
end
