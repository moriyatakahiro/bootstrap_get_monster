class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :login, only: [ :new, :show, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit]
  
  def index
    def index
    @search_task = Property.new
    @tasks = current_user.tasks.recent.page(params[:page])

    if params[:task].present?
      @tasks = current_user.tasks.title_search(params[:task][:name]).page(params[:page])
      if params[:task][:status].present?
        @tasks = current_user.tasks.status_search(params[:task][:status]).page(params[:page])
      end
      if params[:task][:label_id].present?
        @tasks = current_user.tasks.label_search(params[:task][:label_id]).page(params[:page])
      end
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
    @favorite = current_user.favorites.find_by(property_id: @property.id)
    @report = Report.where(city: @property.city)
  end
  
  def destroy
    @property.destroy
    redirect_to admin_properties_path, notice:"物件を削除しました！"
  end
  
  def confirm
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    render :new if @property.invalid?
  end
  
  def city
    @properties = Property.search_city(params[:id])
    render 'index'
  end
  
  def pokestop
    @properties = Property.search_pokestop(params[:pokestop])
    render 'index'
  end
  
  private
  
  def property_params
    params.require(:property).permit(:name, :city, :town, :postful_code, :postful_code_after, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age, :image, :search)
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