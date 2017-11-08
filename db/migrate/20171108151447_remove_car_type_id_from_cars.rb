class RemoveCarTypeIdFromCars < ActiveRecord::Migration[5.1]
  def change
    remove_column :cars, :car_type_id
  end
end
