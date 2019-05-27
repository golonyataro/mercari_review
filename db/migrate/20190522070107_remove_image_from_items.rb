class RemoveImageFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :image, null: false
  end
end
