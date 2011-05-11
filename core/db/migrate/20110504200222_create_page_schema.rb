class CreatePageSchema < ActiveRecord::Migration
  def up
    create_table :pages, :force => true do |t|
      #awesome_nested_set
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      #/awesome_nested_set
      #text_variables
      t.string  :title
      t.string  :description
      t.string  :slug
      #/text_variables
      t.timestamps
    end
    
    add_index :pages, :slug
  end

  def down
    remove_index :pages, :slug
    drop_table :pages
  end
end