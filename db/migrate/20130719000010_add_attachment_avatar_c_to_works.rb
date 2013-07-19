class AddAttachmentAvatarCToWorks < ActiveRecord::Migration
  def self.up
    change_table :works do |t|
      t.attachment :avatar_c
    end
  end

  def self.down
    drop_attached_file :works, :avatar_c
  end
end
