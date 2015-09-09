# gig-db.com

tables & migration commands
CONCERT
artist
venue_id
date
bin/rails generate migration CreateConcerts artist:string date:date

CONCERTVENUE
has and belongs to many
concert_id
venue_id

bin/rails g migration CreateConcertsVenues

VENUE
name
city 
country
concert_id
bin/rails generate migration CreateVenues name:string city:string country:string

PHOTOS
concert_id
user_id
photo
bin/rails generate migration CreatePhotos photo:string

USERCONCERT
has and belongs to many
user_id
concert_id

bin/rails g migration CreateUsersConcerts
rails generate migration CreateJoinTableUsersConcerts user concert


USER
name
email
password
bin/rails generate migration CreateUsers name:string email:string password:string