class AddcolumnsCityIntegerToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :city, :integer, default: 0, null: false, limit: 1
  end
end
