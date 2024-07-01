require 'sqlite3'

db_file_path = File.join(File.dirname(__FILE__), "db/jukebox.sqlite")
DB = SQLite3::Database.new(db_file_path)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  DB.execute("SELECT tracks.name, albums.title, artists.name FROM tracks JOIN albums ON tracks.album_id = albums.id JOIN artists ON albums.artist_id = artists.id")
end

#  p detailed_tracks(DB)

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  query = "SELECT genres.name, COUNT(tracks.id), ROUND(AVG(tracks.milliseconds) / 60000, 2) FROM genres JOIN tracks ON tracks.genre_id = genres.id WHERE genres.name = ?"
  result = DB.execute(query, genre_name).flatten
  return {
    category: result[0],
    number_of_songs: result[1],
    avg_length: result[2]
  }
end

# p stats_on(DB, "Jazz")



def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = "SELECT artists.id, artists.name, COUNT(tracks.id) AS track_count FROM artists JOIN albums ON artists.id = albums.artist_id JOIN tracks ON albums.id = tracks.album_id JOIN genres ON tracks.genre_id = genres.id WHERE genres.name = ? GROUP BY artists.id ORDER BY track_count DESC LIMIT 5"
  DB.execute(query, genre_name)
end

# p top_five_artists(DB, "Jazz")
