class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end
  
  def new
    @property = Property.new
  end
  
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "物件を投稿しました！"
    else
      render 'new'
    end
  end
  
  def edit
    @property = Property.find(params[:id])
  end
  
  def update
    @property= Property.find(params[:id])
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件を編集しました！"
    else
      render 'edit'
    end
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def destroy
    @property.destroy
    redirect_to properties_path, notice:"物件を削除しました！"
  end
  
  def confirm
    @property = Property.new(property_params)
  end
  
  private
  
  def property_params
    params.require(:property).permit(:name, :city, :town, :postful_code, :adress, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age,)
  end
end
