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

  include PgSearch::Model
  pg_search_scope :search_by_title_author_gender,
    against: [ :title, :author ],
    associated_against: {
      genre: [ :name ]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
