class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,              null: false, default: ""
      t.text :explanation,         null: false
      t.integer :category_id,      null: false
      t.integer :status_id,        null: false
      t.integer :shipping_id,      null: false
      t.integer :prefecture_id,    null: false
      t.integer :day_id,           null: false
      t.integer :money,            null: false
      t.references :user,          foreign_key: true
      t.timestamps
    end
  end
end