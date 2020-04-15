class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :image
      t.datetime :start_time
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
