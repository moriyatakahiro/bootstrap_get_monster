class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end
  
  def new
    @property = Property.new
  end
  
  def create
    Property.create(property_params)
    redirect_to new_property_path
  end
  
  def show
  end
  
  private
  
  def property_params
    params.require(:property).permit(:name, :city, :town, :postful_code, :adress, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age,)
  end
end
