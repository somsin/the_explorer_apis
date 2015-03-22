class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.integer :deal_id
      t.date :start_at
      t.date :end_at
      t.integer :logo_id

      t.timestamps
    end
  end
end
