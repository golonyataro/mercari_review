class RemoveBuyerForeignkeyFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_reference :items, :buyer, foreign_key: true
  end
end
