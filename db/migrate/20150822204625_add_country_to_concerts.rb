class AddCountryToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :country, :string
  end
end
