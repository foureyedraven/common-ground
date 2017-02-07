# This migration comes from commonsource (originally 20170127223211)
class CreateCommonsourceEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :commonsource_entries do |t|
      t.string :type, index: true
      t.string :title
      t.string :slug, index: true
      t.json :payload
      t.integer :user_id, index: true
      t.string :author_name
    
      t.datetime :published_at
      t.timestamps
    end
  end
end
