class CreateDormitories < ActiveRecord::Migration
  def change
    create_table :dormitories do |t|
      t.text :address_country
      t.text :address_city
      t.text :address_postal_code
      t.text :address_street_name
      t.text :address_street_number

      t.timestamps null: false
    end
  end
end
