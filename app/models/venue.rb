class Venue < ActiveRecord::Base

  has_many :concerts

  # scope :search_name, -> { where(name: true) }
  # scope :search_city, -> { where(city: true) }
  # scope :search_country, -> { where(country: true) }


    def self.search(name,city,country)
        if name 
          query = where('name LIKE ?', "%#{name}%")
        else
          query = all
        end
          if city 
            query = query.where('city LIKE ?',"%#{city}")
          end
            if country
              query = query.where('country LIKE ?',"%#{country}")
            end
      query
    end
end