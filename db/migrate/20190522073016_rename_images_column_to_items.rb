class RenameImagesColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :images, :image
  end
end
