class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :event_id
      t.string :embed_path
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
