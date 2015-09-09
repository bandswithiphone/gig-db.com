class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo
      t.integer :user_id
      t.integer :concert_id
    end
  end
end
