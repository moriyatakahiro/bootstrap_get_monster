class RemoveColumnIntegerFloorSpaceFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :floor_space
  end
end
