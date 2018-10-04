class HobbiesController < ApplicationController

  def index
    @hobbies = Hobby.all
  end
  
  def show
    
  end
end
