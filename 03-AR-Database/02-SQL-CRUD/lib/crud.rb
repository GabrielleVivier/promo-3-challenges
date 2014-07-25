require 'sqlite3'

def create_scheme(db)
  #TODO: create your db scheme
  sql = %q{ CREATE TABLE news
    (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100),
      source_url VARCHAR(200),
      date DATETIME,
      rating INT
    )
  }  # %q allows for multiline string in ruby
  db.execute(sql)
end

def create_post(db, post)
  #TODO: add a new post to your db
  db.execute("INSERT INTO news (name, source_url, date, rating)
              VALUES ('#{post[:name]}', '#{post[:source_url]}', '#{post[:date]}', #{post[:rating].to_i})")
end

def get_posts(db)
   #TODO: list all posts
   puts db.execute("SELECT * FROM news")
end

def get_post(db, id)
  #TODO: get a specific post
  puts db.execute("SELECT *
              FROM news
              WHERE id = #{id.to_i}")
end

def update_post(db, id, name)
	#TODO: update a post's name in your db
  db.execute("UPDATE news
              SET name = '#{name}' WHERE id = #{id.to_i}")
end

def delete_posts(db)
  #TODO: delete a post in your db
  db.execute("DELETE FROM news")
end

def delete_post(db, id)
  #TODO: delete a specific post in your db
  db.execute("DELETE FROM news
              WHERE id = #{id.to_i}")
end


