class AddColumnStringFloorSpaceToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :floor_space, :string
  end
end
