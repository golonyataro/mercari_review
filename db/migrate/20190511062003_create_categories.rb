class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :category_large
      t.string :category_medium
      t.string :category_small
      t.string :category_size

      t.timestamps
    end
  end
end
