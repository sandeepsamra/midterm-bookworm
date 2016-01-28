class User < ActiveRecord::Base
  has_many :books

  validates :email, uniqueness: true
end