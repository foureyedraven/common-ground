# This migration comes from commonsource (originally 20170211202921)
class AddAttachmentColumnsToEntries < ActiveRecord::Migration[5.0]
  def change
    add_attachment :commonsource_entries, :image
  end
end
