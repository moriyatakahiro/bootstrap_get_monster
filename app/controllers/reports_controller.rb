class ReportsController < ApplicationController
  def index
    @reports = Report.all
    if params[:report][:search] == 'true'
      @reports = Report.all.city_search
    end
  end
  
  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to reports_path
    else
      render 'new'
    end
  end
  
  def destroy
    @report = Report.find(params[:id])
    @report.destroy
    redirect_to reports_path
  end
  
  private
  
  def report_params
    params.require(:report).permit(:title, :content, :city, :town, :adress, :image, :image_cache)
  end
end

 