class AddPermissionsToBase < ActiveRecord::Migration
  def change
    create_table :permissions, :force => true do |t|
      t.string      :subject_class
      t.string      :action
      t.string      :name
      t.string      :description
      t.timestamps
    end
    
    create_table :permissions_roles, :id=>false, :force => true do |t|
      t.integer :permission_id
      t.integer :role_id
    end
  end
end