require "sqlite3"

DB = SQLite3::Database.new(File.join(File.dirname(__FILE__), 'db/jukebox.sqlite'))
rows = DB.execute("SELECT * FROM artists LIMIT 20")

# puts rows[5][0]

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  result = db.execute("SELECT COUNT(*) FROM artists")
  result[0][0]
  # Should return an integer of the number of artists.
end

# puts artist_count(DB)

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name.
  # Should return an integer of the number of rows.
  result = db.execute("SELECT COUNT(*) FROM #{table_name}")
  result[0][0]
end

# puts number_of_rows(DB, "tracks")

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically.
  # Should return an array of strings sorted alphabetically.
  result = db.execute("SELECT name FROM artists ORDER BY name ASC")
  result.flatten
end

# p sorted_artists(DB)

def love_tracks(db)
  # TODO: return array of love songs' names.
  # Should return an array of strings (track names).
  result = db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'")
  result.flatten
end

# p love_tracks(DB)

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending).
  # Should return an array of strings.
  # Convertir la durée minimale en minutes en millisecondes
  min_length_ms = min_length * 60_000
  # Requête SQL sécurisée avec paramètre de requête pour éviter les injections SQL
  query = "SELECT name FROM tracks WHERE milliseconds > ? ORDER BY milliseconds ASC"
  # Exécuter la requête SQL avec le paramètre sécurisé
  result = db.execute(query, min_length_ms)
  result.flatten
end

# p long_tracks(DB,60)

def albums_per_artist(db)
  # TODO: return an array of arrays, each containing the artist's name and the number of albums they have
  query = <<-SQL
    SELECT artists.name, COUNT(*) as album_count
    FROM artists
    JOIN albums ON albums.artist_id = artists.id
    GROUP BY artists.name
    ORDER BY artists.name
  SQL
  db.execute(query)
end

# p albums_per_artist(DB)
