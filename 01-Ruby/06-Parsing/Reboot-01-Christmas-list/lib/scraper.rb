require 'nokogiri'

filepath = "/Users/diegonavarro/code/DiegNav33/fullstack-challenges-master/01-Ruby/06-Parsing/Reboot-01-Christmas-list/results.html"
html_content = File.open(filepath)
doc = Nokogiri::HTML.parse(html_content)

# Afficher le contenu du fichier HTML
puts "Contenu du fichier HTML :"
puts html_content.read

# Rechercher les titres des articles et les afficher
puts "Titres des articles trouvés :"
titles_count = 0
doc.search('.v2-listing-card__info .v2-listing-card__title').each do |element|
  puts element.text.strip
  titles_count += 1
end

puts "Nombre total de titres d'articles trouvés : #{titles_count}"
