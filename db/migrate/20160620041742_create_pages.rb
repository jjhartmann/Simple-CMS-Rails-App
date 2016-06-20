class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :permalink
      t.integer :position
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
