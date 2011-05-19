class AddUsersTableAndDeviseIntegration < ActiveRecord::Migration
  def up
    create_table :users, :force => true do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      
      t.confirmable
      
      t.timestamps
    end
    
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    
    create_table :user_tokens, :force => true do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.timestamps
    end
  end

  def down
    drop_table :users
    drop_table :user_tokens
  end
end