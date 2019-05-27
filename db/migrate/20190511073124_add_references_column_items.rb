class AddReferencesColumnItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category, null: false, foreign_key: true
    add_reference :items, :bland, foreign_key: true
    add_reference :items, :exhibitor, null: false, foreign_key: true
    add_reference :items, :buyer, foreign_key: true
  end
end
