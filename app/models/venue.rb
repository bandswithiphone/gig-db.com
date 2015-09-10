class Venue < ActiveRecord::Base

  has_many :concerts

  validates_uniqueness_of :name

  # scope :search_name, -> { where(name: true) }
  # scope :search_city, -> { where(city: true) }
  # scope :search_country, -> { where(country: true) }

  def name_with_city
    "#{name}, #{city}"
  end

end