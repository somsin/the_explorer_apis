class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.text :title
      t.integer :logo_id
      t.text :banner_ids
      t.text :description
      t.date :start_at
      t.date :end_at
      t.integer :merchant_id
      t.decimal :price
      t.string :discount
      t.integer :avail_count
      t.integer :sold_count
      t.string :deal_type
      t.binary :uuid
      t.boolean :event_flag
      t.string :name
      t.string :logo_image
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4

      t.timestamps
    end
  end
end
