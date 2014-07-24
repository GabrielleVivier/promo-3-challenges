require 'sqlite3'

# opens the database
database_path = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(database_path)

def number_of_rows(db, table_name)
  #TODO: count number of rows in table table_name
  array = db.execute("SELECT COUNT(*) FROM #{table_name}")
  array[0][0]
end

def sorted_artists(db)
  #TODO: return array of artists' names sorted alphabetically
  db.execute("SELECT Name FROM Artist ORDER BY Name ASC").flatten
end

def love_tracks(db)
  #TODO: return array of love songs
  db.execute("SELECT Name FROM Track WHERE Name LIKE '%Love%'").flatten
end

def long_tracks(db, min_length)
  #TODO: return tracks verifying: duration > min_length (minutes)
  min_length = min_length*60000
  db.execute("SELECT Name FROM Track t WHERE t.Milliseconds > #{min_length}").flatten
end
