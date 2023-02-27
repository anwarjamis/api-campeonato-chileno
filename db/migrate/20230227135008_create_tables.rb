class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :tables do |t|
      t.integer :position
      t.string :club
      t.integer :points
      t.integer :played
      t.integer :won
      t.integer :drawn
      t.integer :lost
      t.integer :gf
      t.integer :ga
      t.integer :gd

      t.timestamps
    end
  end
end
