class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :post_id, index: true
      t.integer :user_id, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
