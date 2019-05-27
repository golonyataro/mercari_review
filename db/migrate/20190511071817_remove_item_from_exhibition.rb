class RemoveItemFromExhibition < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :exhibitors, :items
    remove_reference :exhibitors, :item, null: false
  end
end
