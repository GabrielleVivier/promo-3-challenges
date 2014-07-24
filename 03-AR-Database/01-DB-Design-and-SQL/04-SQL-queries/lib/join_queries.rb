require 'sqlite3'

# opens the database
DATABASE_PATH = "lib/db/jukebox.sqlite"
db = SQLite3::Database.new(DATABASE_PATH)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute("SELECT Track.Name, Artist.Name, Album.Title
              FROM Track
              JOIN Artist ON Artist.ArtistId = Album.ArtistId
              JOIN Album ON Track.AlbumId = Album.AlbumId")
end

def stats_on(db, category)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  # category_id = db.execute("SELECT Genre.GenreId
  #                           FROM Genre
  #                           WHERE Genre.Name = '#{category}'")
  array = db.execute("SELECT COUNT(*), AVG(Track.Milliseconds)
                      FROM Track
                      JOIN Genre ON Track.GenreId = Genre.GenreId
                      AND Genre.Name = '#{category}'")
  hash = Hash.new
  hash[:category] = category
  hash[:number_of_songs] = array[0][0]
  hash[:avg_lenght] = array[0][1]
  return hash
end

p stats_on(db, "Latin")

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists
  array = db.execute("SELECT Artist.Name, COUNT(*) occurrences
              FROM Artist
              JOIN Album ON Album.ArtistId = Artist.ArtistId
              JOIN Track ON Track.AlbumId = Album.AlbumId
              JOIN Genre ON Track.GenreId = Genre.GenreId
              AND Genre.Name = 'Rock'
              GROUP BY Artist.Name
              ORDER BY occurrences DESC
              LIMIT 5")
  array.map { |result| result[0] }
end

p top_five_rock_artists(db)


