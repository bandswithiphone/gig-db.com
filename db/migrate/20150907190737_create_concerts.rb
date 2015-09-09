class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :artist
      t.date :date
      t.integer :venue_id
    end
  end
end
