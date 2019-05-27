class RemoveItemFromBuyers < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :buyers, :items
    remove_reference :buyers, :item, null: false
  end
end
