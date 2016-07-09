class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :zip
      t.string :province
      t.string :city
      t.string :street
      t.string :number
      t.string :phone

      t.timestamps null: false
    end
  end
end
