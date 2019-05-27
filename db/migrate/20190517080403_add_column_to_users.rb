class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :firstname_kanji, :string
    add_column :users, :lastname_kanji, :string
    add_column :users, :firstname_kana, :string
    add_column :users, :lastname_kana, :string
    add_column :users, :birth_year, :string
    add_column :users, :birth_month, :string
    add_column :users, :birth_day, :string
  end
end
