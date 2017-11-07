class CreateCarTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :car_types do |t|
      t.string :name
    end
  end
end
