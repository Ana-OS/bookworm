class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :users_books
  has_many :users, through: :users_books
  belongs_to :genre
  # has_one_attached :photo

  belongs_to :author
  has_one_attached :photo

  validates :title, presence: true
  validates :title, uniqueness: { scope: :author }

end
