class CreateUserCars < ActiveRecord::Migration[5.1]
  def change
    create_table :user_cars do |t|
      t.integer :car_id
      t.integer :user_id
    end
  end
end
