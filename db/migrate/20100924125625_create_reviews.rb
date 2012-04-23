class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :user_id
      t.text :comment
      t.integer :rating
      t.integer :status
      t.integer :reviewable_id
      t.string :reviewable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
