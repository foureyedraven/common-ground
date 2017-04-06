# This migration comes from commonsource (originally 20170211230955)
class CreateCommonsourceImages < ActiveRecord::Migration[5.0]
  def change
    create_table :commonsource_images do |t|
      t.references :commonsource_gallery, foreign_key: true
      t.attachment :paperclip
      t.timestamps
    end
  end
end
