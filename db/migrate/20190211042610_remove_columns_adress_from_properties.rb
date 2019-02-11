class RemoveColumnsAdressFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :adress
  end
end
