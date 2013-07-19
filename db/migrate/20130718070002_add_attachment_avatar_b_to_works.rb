class AddAttachmentAvatarBToWorks < ActiveRecord::Migration
  def self.up
    change_table :works do |t|
      t.attachment :avatar_b
    end
  end

  def self.down
    drop_attached_file :works, :avatar_b
  end
end
