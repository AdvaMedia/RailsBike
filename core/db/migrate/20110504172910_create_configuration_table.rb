class CreateConfigurationTable < ActiveRecord::Migration
  def up
    create_table "configurations", :force => true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "type", :limit => 50
    end

    add_index "configurations", ["name", "type"], :name => "index_configurations_on_name_and_type"
    
    create_table "preferences", :force => true do |t|
      t.string   "name",  :null => false, :limit => 100
      t.integer  "owner_id",   :null => false, :limit => 30
      t.string   "owner_type", :null => false, :limit => 50
      t.integer  "group_id"
      t.string   "group_type", :limit => 50
      t.text     "value"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
    
  end

  def down
    #Not one step back
  end
end
