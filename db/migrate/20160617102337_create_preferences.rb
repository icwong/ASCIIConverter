class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences, id: false do |t|
    	t.primary_key :user_id
    	t.string :name

    	t.timestamps null: false
    end
  end
end
