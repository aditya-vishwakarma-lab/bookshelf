class Book < ApplicationRecord

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :cover, presence: true

end
