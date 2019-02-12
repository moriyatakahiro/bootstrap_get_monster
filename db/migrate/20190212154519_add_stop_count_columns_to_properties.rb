class AddStopCountColumnsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :floor_plan, :integer, default: 0, null: false, limit: 1
  end
end
