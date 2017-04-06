# This migration comes from commonsource (originally 20170211230909)
class CreateCommonsourceGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :commonsource_galleries do |t|
      t.references :commonsource_entry, foreign_key: true

      t.timestamps
    end
  end
end
