class AddColumnShippingRegion < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :shipping_region, :string
  end
end
