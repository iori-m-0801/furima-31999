class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture,                  null: false
      t.string :city,           default: "",  null: false
      t.string :city_number,    default: "",  null: false
      t.string :building,       default: ""
      t.string :tel,            default: "",  null: false
      t.references :shopping,                 null: false,  foreign_key: true
      t.timestamps
    end
  end
end
