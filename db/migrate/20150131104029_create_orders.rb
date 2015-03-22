class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :deal_id
      t.integer :deal_count
      t.boolean :is_redeem
      t.text :voucher_code
      t.integer :rating

      t.timestamps
    end
  end
end
