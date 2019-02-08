class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(property_id: params[:properties_id])
     redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  def index
    @favorites = current_user.favorites
  end
  
  
end