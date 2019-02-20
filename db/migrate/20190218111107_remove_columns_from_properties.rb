class RemoveColumnsFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :city
  end
end
