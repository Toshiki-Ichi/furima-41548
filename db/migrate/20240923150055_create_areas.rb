class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.string :postal,                null: false
      t.integer :region_id,            null: false
      t.string :city,                  null: false
      t.string :city_num,              null: false
      t.string :building
      t.string :tel_num,               null: false
      t.references :customer,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
