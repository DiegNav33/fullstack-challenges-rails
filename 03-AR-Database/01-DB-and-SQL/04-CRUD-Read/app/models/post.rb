# You can use a global variable, DB, which is an instance of SQLite3::Database
# No need to create it, you can just use it!

class Post

  attr_reader :id, :votes
  attr_accessor :title, :url

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
  end

  def self.find(id)
    DB.results_as_hash = true
    query = "SELECT * FROM posts WHERE id = ? LIMIT 1"
    result = DB.execute(query, id)[0]
    return nil if result.nil?
    build_record(result)
  end

  def self.all
    DB.results_as_hash = true
    result = DB.execute("SELECT * FROM posts")
    result.map do |row|
      build_record(row)
    end
  end

  private

  def self.build_record(row)
    attributes = {
      id: row["id"],
      title: row["title"],
      url: row["url"],
      votes: row["votes"]
    }
    Post.new(attributes)
  end
end
