class AddAttachmentAvatarDToWorks < ActiveRecord::Migration
  def self.up
    change_table :works do |t|
      t.attachment :avatar_d
    end
  end

  def self.down
    drop_attached_file :works, :avatar_d
  end
end
