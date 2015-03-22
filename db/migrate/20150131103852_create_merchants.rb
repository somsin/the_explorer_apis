class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :email_address
      t.string :name
      t.integer :address_id
      t.date :expire_at
      t.string :merchant_type
      t.binary :uuid

      t.timestamps
    end
  end
end
