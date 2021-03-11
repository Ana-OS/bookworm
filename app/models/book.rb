class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users_books
  has_many :users, through: :users_books
  belongs_to :genre
<<<<<<< HEAD
  # has_one_attached :photo
=======
  belongs_to :author
  has_one_attached :photo
>>>>>>> 1030043e9ab258a10cbdc1b79d94b0c4eb259ad6

  validates :title, presence: true
  validates :title, uniqueness: { scope: :author }

<<<<<<< HEAD

=======
>>>>>>> 1030043e9ab258a10cbdc1b79d94b0c4eb259ad6
end
