class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.text :label
      t.text :notes
      t.references :dormitory, index: true

      t.timestamps null: false
    end
    add_foreign_key :machines, :dormitories
  end
end
