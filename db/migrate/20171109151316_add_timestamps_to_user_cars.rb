class AddTimestampsToUserCars < ActiveRecord::Migration[5.1]
  def change
    add_column :user_cars, :created_at, :datetime
    add_column :user_cars, :updated_at, :datetime
  end
end
