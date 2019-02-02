class RemoveCityColumnsFromReports < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :city
  end
end
