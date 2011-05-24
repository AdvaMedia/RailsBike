class AddRolesForUsers < ActiveRecord::Migration
  def up
    create_table :roles, :force => true do |t|
      t.string      :name
      t.string      :description
      t.timestamps
    end
    create_table :assignments, :force => true do |t|
      t.integer     :user_id
      t.integer     :role_id
      t.timestamps
    end
  end

  def down
    drop_table :role
  end
end