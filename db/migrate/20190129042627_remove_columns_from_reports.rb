class RemoveColumnsFromReports < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :user_id
    
    remove_column :reports, :property_id
  end
end
