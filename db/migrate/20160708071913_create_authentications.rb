class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications, id: false do |t|
      t.primary_key :user_id
      t.boolean :pass, default: false
      t.date :approved_date
      t.date :applied_date


      t.timestamps null: false
    end

    add_index :authentications, :approved_date
    add_index :authentications, :applied_date
  end
end
