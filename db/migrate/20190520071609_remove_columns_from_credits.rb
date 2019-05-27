class RemoveColumnsFromCredits < ActiveRecord::Migration[5.0]
  def change
    remove_column :credits, :number
    remove_column :credits, :expiration_month
    remove_column :credits, :expiration_year
    remove_column :credits, :code
  end
end
