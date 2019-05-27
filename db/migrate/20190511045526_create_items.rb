class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      # t.references :category, null: false, foreign_key: true
      # t.references :bland, foreign_key: true
      # t.references :exhibitor, null: false, foreign_key: true
      # t.references :buyer, foreign_key: true
      t.string :name, null: false
      t.string :image, null: false
      t.text :explain, null: false
      t.integer :price, null: false
      t.string :status, null: false
      t.string :shipping_which, null: false
      t.string :shipping_day, null: false
      t.string :shipping_method, null: false

      t.timestamps
    end
  end
end
