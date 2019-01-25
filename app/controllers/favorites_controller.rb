class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(property_id: params[:properties_id])
    redirect_to users_path
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to users_path
  end
end