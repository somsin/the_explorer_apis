class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :name
      t.integer :deal_id
      t.string :image
      t.timestamps
    end
  end
end
