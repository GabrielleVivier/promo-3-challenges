class User < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\[^@]+@[^@]\.[^@]\z/ }
end