class AddPostfulCodeAfterToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :postful_code_after, :integer
  end
end
