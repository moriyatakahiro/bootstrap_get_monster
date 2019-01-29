class AddColumnsToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :city, :string
    
    add_column :reports, :town, :string
    
    add_column :reports, :adress, :integer
  end
end
