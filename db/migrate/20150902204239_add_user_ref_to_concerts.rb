class AddUserRefToConcerts < ActiveRecord::Migration
  def change
    add_reference :concerts, :user, index: true, foreign_key: true
  end
end
