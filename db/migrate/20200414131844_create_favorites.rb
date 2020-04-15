class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.string :name
      t.integer :rank
      t.string :image
      t.string :url
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
