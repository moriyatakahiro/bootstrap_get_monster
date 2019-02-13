class AddColumnintegerFloorPlanToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :floor_plan, :string
  end
end
