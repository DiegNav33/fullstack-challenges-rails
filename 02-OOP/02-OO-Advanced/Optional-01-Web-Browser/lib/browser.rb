require 'nokogiri'
require 'open-uri'

class Browser
  def initialize
    # Any initialization can go here
  end

  def fetch_content(url)
    content = ""
    begin
      html = URI.open(url) # open the html of the page
      doc = Nokogiri::HTML.parse(html)
      content = doc.text.strip
    rescue OpenURI::HTTPError => e
      content = "Error fetching the URL: #{e.message}"
    rescue => e
      content = "An unexpected error occurred: #{e.message}"
    end
    content
  end
end
