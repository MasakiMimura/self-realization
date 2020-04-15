class CreateRoutines < ActiveRecord::Migration[5.0]
  def change
    create_table :routines do |t|
      t.string :content
      t.integer :turn
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
