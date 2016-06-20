class CreateUsers < ActiveRecord::Migration
  
  # Long Way
  def up
    create_table :users do |t|
      # long version
      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 25
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      
            # Long way 
      # t.datetime "created_at"
      # t.datetime "updated_at"

      t.timestamps 

      # Short: t.type "name", :options


      t.timestamps null: false
    end
  end

  def down
  	drop_table :users 
  end
end
