class Concert < ActiveRecord::Base

  belongs_to :venue
  has_and_belongs_to_many  :users
  has_many :photos

  validates_uniqueness_of :artist, :scope => :date

  def concert_details
    "#{artist}, #{date}"
  end

  # scope :associated_venues, lambda { |venue| 
  #           includes(:venues).where('venue.name LIKE ?', "%#{venue}%") 
  # }

  # scope :search_artist, -> { where(artist: true) }
  # scope :search_venue, -> { where(venue: true) }
  # scope :search_city, -> { where(city: true) }
  # scope :search_country, -> { where(country: true) }`
  # scope :sorted_by_date, -> { order(:date) }


  # def self.search(artist,name,city,country)
  #     if artist 
  #       query = where('artist LIKE ?', "%#{artist}%")
  #     else
  #       query = all
  #     end
  #     if venue 
  #       query = query.where('name LIKE ?',"%#{venue}")
  #     end
  #      if city 
  #       query = query.where('city LIKE ?',"%#{city}")
  #     end
  #      if country
  #       query = query.where('country LIKE ?',"%#{country}")
  #     end
  #   query
  # end
end
