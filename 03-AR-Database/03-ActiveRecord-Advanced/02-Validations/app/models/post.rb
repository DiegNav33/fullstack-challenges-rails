class Post < ActiveRecord::Base
  belongs_to :user

  # TODO: Add some validation
  validates :title, presence: true, length: {minimum: 5}, uniqueness: {case_sensitive: false}
  validates :user, presence: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp, message: "is invalid" }
end
