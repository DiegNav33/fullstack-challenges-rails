require "open-uri"
require "nokogiri"

def scrape_recipes(search)
  # TODO: return an array of recipes found of the website for this `search`.
  array = []
  last_page = scrape_last_page(search)
  (1..last_page).each do |page_number|
    url = "https://recipes.lewagon.com/?search%5Bquery%5D=#{search}&button=&page=#{page_number}}"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)
    html_doc.search(".recipe-name").each_with_index do |element, index|
      array << element.text.strip
      puts "Recipe #{index + 1} from page #{page_number}: #{element.text.strip}"
    end
  end
  # array
end

def scrape_last_page(search)
  url = "https://recipes.lewagon.com/?search%5Bquery%5D=#{search}&button=}"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  pages = html_doc.search(".page-link").map do |page|
    page.text
  end

  pages[-2].to_i
end

p scrape_recipes("chocolat")
