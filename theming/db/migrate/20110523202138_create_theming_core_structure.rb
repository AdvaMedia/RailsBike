class CreateThemingCoreStructure < ActiveRecord::Migration
  def change
    change_table :pages do |t|
      t.string    :layout_name
      t.boolean   :inherit_css, :default=>true
      t.boolean   :inherit_layout, :default=>true      
    end
    
    create_table :css_files, :force=>true do |t|
      #awesome_nested_set
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      #/awesome_nested_set
      t.string  :name
      t.text    :content
      t.timestamps
    end
  end
end
