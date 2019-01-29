class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end
  
  def new
    @report = Report.new
  end
  
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to reports_path, notice: "GET報告を投稿しました！"
    else
      render 'new'
    end
  end
  
  def destroy
  end
  
  private
  
  def report_params
    params.require(:report).permit(:title, :content)
  end
end

 