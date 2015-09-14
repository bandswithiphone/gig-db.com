class User < ActiveRecord::Base

  has_secure_password
  has_and_belongs_to_many :concerts
  has_and_belongs_to_many :photos

  validates :email, :presence => true
end
