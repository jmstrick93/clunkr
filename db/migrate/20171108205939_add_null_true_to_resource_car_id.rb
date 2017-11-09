class AddNullTrueToResourceCarId < ActiveRecord::Migration[5.1]
  def change
    change_column_null :resources, :car_id, true
  end
end
