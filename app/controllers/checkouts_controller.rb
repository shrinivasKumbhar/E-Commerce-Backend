class CheckoutsController < ApplicationController
  
  def index
    @areas = Area.where(:is_active => true) 
  end
end
