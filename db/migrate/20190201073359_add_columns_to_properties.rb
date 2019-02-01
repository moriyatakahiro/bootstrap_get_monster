class AddColumnsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :image, :text
  end
end
