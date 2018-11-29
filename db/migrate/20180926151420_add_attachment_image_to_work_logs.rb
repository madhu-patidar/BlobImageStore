class AddAttachmentImageToWorkLogs < ActiveRecord::Migration[5.1]
  def self.up
    change_table :work_logs do |t|
      t.attachment :image
      t.string :url, index: true
      t.integer :key_press_count, index: true
      t.integer :mouse_movement_count, index: true
    end
  end

  def self.down
    remove_attachment :work_logs, :image
  end
end
