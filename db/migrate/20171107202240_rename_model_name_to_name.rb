class RenameModelNameToName < ActiveRecord::Migration[5.1]
  def change
    rename_column :cars, :model_name, :name
  end
end
