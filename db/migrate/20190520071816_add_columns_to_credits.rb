class AddColumnsToCredits < ActiveRecord::Migration[5.0]
  def change
    add_column :credits, :customer_id, :string, null: false
    add_column :credits, :card_id, :string, null: false
  end
end
