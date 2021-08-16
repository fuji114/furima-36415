class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name,           null: false
      t.text :product_description,           null: false
      t.integer :category_id,           null: false
      t.integer :status_id,           null: false
      t.integer :invoice_price_id,           null: false
      t.integer :invoice_territory_id,           null: false
      t.integer :days_to_delivery_id,           null: false
      t.integer :product_price,           null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
