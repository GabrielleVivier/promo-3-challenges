class Post < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :date, presence: true
  validates :source_url, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :user_id, presence: true
end