class CreateEncounts < ActiveRecord::Migration[5.1]
  def change
    create_table :encounts do |t|
      t.integer :property_id
      t.integer :report_id

      t.timestamps
    end
  end
end
