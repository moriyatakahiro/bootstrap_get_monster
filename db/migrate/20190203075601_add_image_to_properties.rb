class AddImageToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :images, :json
  end
end
