class Book < ApplicationRecord
  belongs_to :author
  has_many :book_subjects
  has_many :subjects, through: :book_subjects
  has_many :book_publishers
  has_many :publishers, through: :book_publishers
  validates :title, :price, :pages, presence: true
end
