# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying books"
Book.destroy_all
puts "destroying authors"
Author.destroy_all


require 'json'
require 'open-uri'

url = 'https://www.googleapis.com/books/v1/volumes?q=flowers+inauthor:virginia+wolf&orderBy=newest'
book_serialized = open(url).read
book = JSON.parse(book_serialized)


book["items"].first(6).each do |item|
  photo_url = item["volumeInfo"]["imageLinks"]

  if !photo_url.empty?
    title = item["volumeInfo"]["title"]
    authors =  item["volumeInfo"]["authors"].each {|author| }
    genres = item["volumeInfo"]["categories"]
   end

end



