class CreatePageSchema < ActiveRecord::Migration
  def up
    create_table :pages, :force => true do |t|
      #awesome_nested_set
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      #/awesome_nested_set
      
      t.timestamps
    end
  end

  def down
    drop_table :pages
  end
end