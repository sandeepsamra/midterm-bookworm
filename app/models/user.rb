class User < ActiveRecord::Base
  has_many :books

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /.*@.*\..*/, :on => :create
  validates :password, presence: true
  validates :name, presence: true
end