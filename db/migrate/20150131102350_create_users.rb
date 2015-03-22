class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_address
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :status
      t.binary :uuid
      t.string :mobile_no
      t.string :device_id
      t.string :pin_code
      t.boolean :email_promotional
      t.string :signup_code
      t.boolean :session_flag

      t.timestamps
    end
  end
end
