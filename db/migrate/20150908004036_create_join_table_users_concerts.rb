class CreateJoinTableUsersConcerts < ActiveRecord::Migration
  def change
    create_join_table :users, :concerts do |t|
      # t.index [:user_id, :concert_id]
      # t.index [:concert_id, :user_id]
    end
  end
end
