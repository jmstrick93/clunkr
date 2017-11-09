class AddQuantityToUserCar < ActiveRecord::Migration[5.1]
  def change
    add_column :user_cars, :quantity, :integer
    add_column :user_cars, :color, :string
  end
end
