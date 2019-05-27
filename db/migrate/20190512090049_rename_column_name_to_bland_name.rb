class RenameColumnNameToBlandName < ActiveRecord::Migration[5.0]
  def change
    rename_column :blands, :name, :bland_name
  end
end
