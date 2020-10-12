class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name                   ,null: false
      t.text :explanation              ,null: false
      t.integer :category_id           ,null: false
      t.integer :condition_id          ,null: false
      t.integer :delivery_charge_id    ,null: false
      t.integer :delivery_source_id    ,null: false
      t.integer :days_to_ship_id       ,null: false
      t.integer :price                 ,null: false
      t.timestamps
    end
  end
end
