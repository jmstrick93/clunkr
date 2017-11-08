class CreateCarTypeCars < ActiveRecord::Migration[5.1]
  def change
    create_table :car_type_cars do |t|
      t.integer :car_type_id
      t.integer :car_id
    end
  end
end
