class AddAttachmentPictureToEposts < ActiveRecord::Migration
  def self.up
    change_table :eposts do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :eposts, :picture
  end
end
