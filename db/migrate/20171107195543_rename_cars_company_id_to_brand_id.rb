class RenameCarsCompanyIdToBrandId < ActiveRecord::Migration[5.1]
  def change
    rename_column :cars, :company_id, :brand_id
  end
end
