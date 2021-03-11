# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying all books"
Book.destroy_all

puts "creating fiction books"
fiction_books = GoogleBooks.search("subject:fiction", {:count => 15, :order_by => 'newest'})
adventure_books = GoogleBooks.search("subject:Adventure", {:count => 15, :order_by => 'newest'})
crime_books = GoogleBooks.search("subject:crime", {:count => 15, :order_by => 'newest'})
black_lives_matter_books = GoogleBooks.search("black lives matter", {:count => 15, :order_by => 'newest'})

# drama = Genre.create(name: "drama")
drama = Genre.create(name: "drama")
fiction = Genre.create(name: "fiction")
adventure = Genre.create(name: "adventure")
crime = Genre.create(name: "crime")
black_lives_matter = Genre.create(name: "black_lives_matter")

fiction_books.each do |book|
  Book.create(title: book.title, author: book.authors, description: book.description, genre: fiction, photo_url: book.image_link(:zoom => 1), preview_link: book.preview_link, buy_link: book.sale_info['buyLink'])
end

adventure_books.each do |book|
  Book.create(title: book.title, author: book.authors, description: book.description, genre: adventure, photo_url: book.image_link(:zoom => 1), preview_link: book.preview_link, buy_link: book.sale_info['buyLink'])
end

crime_books.each do |book|
  Book.create(title: book.title, author: book.authors, description: book.description, genre: crime, photo_url: book.image_link(:zoom => 1), preview_link: book.preview_link, buy_link: book.sale_info['buyLink'])
end


black_lives_matter_books.each do |book|
  Book.create(title: book.title, author: book.authors, description: book.description, genre: black_lives_matter, photo_url: book.image_link(:zoom => 1), preview_link: book.preview_link, buy_link: book.sale_info['buyLink'])
end
