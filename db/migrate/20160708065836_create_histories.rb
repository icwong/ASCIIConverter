class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id, index: true
      t.integer :post_id, index: true
      t.integer :count, default: 0, null: false
      t.date :last_visit_date

      t.timestamps null: false
    end
  end
end
