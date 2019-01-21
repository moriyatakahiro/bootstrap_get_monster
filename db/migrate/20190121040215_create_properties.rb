class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.integer :postful_code
      t.string :city
      t.string :town
      t.integer :adress
      t.string :after_adress
      t.integer :property_age
      t.integer :rent
      t.string :floor_space
      t.string :floor_plan
      t.string :encount_monster
      t.integer :stop_count
      t.string :stop_adress
      t.text :floor_plan_image
      
    end
  end
end
