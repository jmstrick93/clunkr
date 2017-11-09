class AddColorToUserCars < ActiveRecord::Migration[5.1]
  def change
    add_column :user_cars, :color, :string
  end
end
