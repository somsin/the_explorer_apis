class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :state
      t.string :street
      t.integer :pincode
      t.text :landmark
      t.decimal :latitude, :precision => 10, :scale => 8
      t.decimal :longitude, :precision => 10, :scale => 8
      t.string :mobile_no
      t.integer :merchant_id
      t.binary :uuid

      t.timestamps
    end
  end
end
