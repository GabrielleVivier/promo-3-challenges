require_relative '../config/application'
require_relative '../models/post'
require_relative '../models/user'

require 'active_record'
require 'sqlite3'
require 'nokogiri'
require 'open-uri'
require 'faker'
require 'time'
require 'ruby-hackernews'
include RubyHackernews


puts 'Seeding database...'

# TODO: Your code goes here
# 1. create fake users
# 2. Scrape news from https://news.ycombinator.com/ and associate posts to your existing users

def seed_users
  if User.count == 0
    50.times { User.create(name: Faker::Name.name, email: Faker::Internet.email) }
  end
end

seed_users

url = "https://news.ycombinator.com/"
doc = Nokogiri::HTML(open(url))

posts = Entry.all(2)

def seed_posts(posts)
  posts.each do |post|
    name = post.link.title
    source_url = post.link.href
    rating = post.voting.score
    post_attributes = { name: name, source_url: source_url, date: Time.now, rating: rating }
    user_id = rand(1..50)
    user = User.find_by_id(user_id)
    user.posts.create(post_attributes)
  end
end


# puts parse_posts(doc)

#   titles = doc.search('.title a')
#   subtexts = doc.search('.subtext')

#   titles.each_with_index do |title, index|
#     name = post.search('a').inner_text.strip
#     source_url = post.search('')
#     rating = post.search('.subtext').inner_text.strip
#     post_attributes = {name: name, date: date, source_url: source_url, rating: rating}
#     user.posts.create(post_attributes)

