class CreateUserSubscribers < ActiveRecord::Migration
  def change
    create_table :user_subscribers do |t|
      t.integer :purchase
      t.date :expire_at
      t.integer :user_id

      t.timestamps
    end
  end
end
