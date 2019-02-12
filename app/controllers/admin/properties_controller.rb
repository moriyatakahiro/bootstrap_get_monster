class Admin::PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :login, only: [ :new, :show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit]
  
  def index
    @properties = Property.search(params[:search])
  end
  
  def new
    if params[:back]
      @property = Property.new(property_params)
    else
      @property = Property.new
    end
  end
  
  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    if @property.save
      redirect_to admin_properties_path, notice: "物件を投稿しました！"
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @property.update(property_params)
      redirect_to admin_properties_path, notice: "物件を編集しました！"
    else
      render 'edit'
    end
  end
  
  def show
    @report = Report.where(city: @property.city)
  end
  
  def destroy
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
    params.require(:property).permit(:name, :city, :town, :postful_code, :postful_code_after, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age, :images_cache, {images: []})
  end
  
  def set_property
    @property = Property.find(params[:id])
  end
  
  def login
    unless  logged_in?
      redirect_to new_session_path
    end
  end
  
  def ensure_correct_user
    if @current_user != @property.user
      redirect_to new_session_path, notice: "無効なアクセスです"
    end
  end
end