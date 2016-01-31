class Book < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :photo, presence: true
end