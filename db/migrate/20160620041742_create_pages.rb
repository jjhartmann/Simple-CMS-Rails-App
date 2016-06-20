class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      # same as t.integer "subject_id"
      t.references :subject
      t.string "name"
      t.string "permalink"
      t.integer "position"
      t.boolean "visible", :default => false

      t.timestamps null: false
    end
    # add index
    add_index("pages", "subject_id")
    add_index("pages", "permalink")
  end

  def down
  	drop_table :pages
  end
end
