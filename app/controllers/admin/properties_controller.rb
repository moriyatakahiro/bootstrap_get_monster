class Admin::PropertiesController < ApplicationController
  def index
    @properties = Property.search(params[:search])
  end
  
  def new
    @property = Property.new
  end
  
  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    if @property.save
      redirect_to admin_properties_path, notice: "物件を投稿しました！"
    else
      render 'admin/new'
    end
  end
  
  def edit
    @property = Property.find(params[:id])
  end
  
  def update
    @property= Property.find(params[:id])
    if @property.update(property_params)
      redirect_to admin_properties_path, notice: "物件を編集しました！"
    else
      render 'edit'
    end
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to admin_properties_path, notice:"物件を削除しました！"
  end
  
  def confirm
    @property = Property.new(property_params)
    @property.city = params[:city][:name]
    @property.user_id = current_user.id
    render :new if @property.invalid?
  end
  
  private
  
  def property_params
    params.require(:property).permit(:name, :city, :town, :postful_code, :postful_code_after, :adress, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age, :images_cache, {images: []})
  end
end