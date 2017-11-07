class RenameCompanyToBrand < ActiveRecord::Migration[5.1]
  def change
   rename_table :companies, :brands
  end
end
