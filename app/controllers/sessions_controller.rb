class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        if @user.try(:admin?)
          redirect_to properties_path
        else
          redirect_to user_path(@user.id)
        end
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render 'new'
      end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end

 private
  
  def login_check
    @current_user = session[:user_id]
    if @current_user.nil?
      redirect_to new_session_path
    end
  end