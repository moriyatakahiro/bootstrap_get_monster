class AddColumnsRentToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :rent, :integer
  end
end
