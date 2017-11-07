class CreateCars < ActiveRecord::Migration[5.1]
  def change
    create_table :cars do |t|
      t.string :model_name
      t.integer :company_id
      t.integer :car_type_id
      t.integer :year
      t.string :photo_url

      t.timestamps
    end
  end
end
