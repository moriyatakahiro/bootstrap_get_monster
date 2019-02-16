class RemoveColumnsRentFromProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :rent
  end
end
