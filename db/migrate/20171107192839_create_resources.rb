class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :title
      t.integer :resource_type_id
      t.integer :car_id
      t.string :source_url

      t.timestamps
    end
  end
end
