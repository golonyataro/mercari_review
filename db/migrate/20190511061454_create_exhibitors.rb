class CreateExhibitors < ActiveRecord::Migration[5.0]
  def change
    create_table :exhibitors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :shipping_cost

      t.timestamps
    end
  end
end
