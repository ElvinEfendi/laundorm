class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :room
      t.references :dormitory, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :dormitories
    add_index :users, [ :room, :dormitory_id ], unique: true
  end
end
