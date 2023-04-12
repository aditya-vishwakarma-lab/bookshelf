class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
  validates :description, presence: true
  validates :language, presence: true
  validates :cover, presence: true

end
