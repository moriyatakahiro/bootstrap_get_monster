class RemoveImageFronProperties < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :image
  end
end
