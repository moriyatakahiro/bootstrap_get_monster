class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: [:show, :new, :edit, :update, :create]
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path, notice: "アカウントを作成しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @q = Property.ransack(params[:q])
    @properties = @q.result(distinct: true)
  end

  def index
  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "アカウントを編集しました"
    else
      render 'new'
    end
  end  

private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :age, :sex)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def ensure_correct_user
    if @current_user != @user
      redirect_to new_session_path, notice: "無効なアクセスです"
    end
  end
end
