# TODO: you can build your christmas list program here!
require 'open-uri'
require 'nokogiri'

puts "> Welcome to your Christmas gift list"
list_gifts = []  # Initialisation de list_gifts comme un tableau vide

loop do
  action = ""
  while action.empty?
    puts "> Which action [list | add | delete | mark | quit]?"
    action = gets.chomp.downcase
  end

  case action
  when "list"
    if list_gifts.empty?
      puts "Your list is empty, please add items before!"
    else
      puts "This is your list:"
      # Parcours de chaque hachage dans list_gifts
      list_gifts.each_with_index do |item, index|
        status = item[:bought] ? "[X]" : "[ ]"  # Détermine le statut de l'article
        puts "#{index + 1} - #{status} #{item[:name]}"  # Affiche l'article avec son statut
      end
    end
  when "add"
    puts "What item do you wanna add to your gift list?"
    item_to_add = gets.chomp
    # Ajoute un hachage avec :name et :bought au tableau list_gifts
    list_gifts << { name: item_to_add, bought: false }
    puts "#{item_to_add} has been added to your list"
  when "delete"
    if list_gifts.empty?
      puts "Your list is empty. Please add items before!"
    else
      puts "Which item do you want to delete (pick with the index)?"
      list_gifts.each_with_index do |item, index|
        status = item[:bought] ? "[X]" : "[ ]"  # Détermine le statut de l'article
        puts "#{index + 1} - #{status} #{item[:name]}"  # Affiche l'article avec son statut
      end
      item_to_delete = gets.chomp.to_i
      # Supprime l'élément à l'index donné
      removed_item = list_gifts.delete_at(item_to_delete - 1)
      puts "#{removed_item[:name]} has been deleted!"  # Affiche le nom de l'article supprimé
    end
  when "mark"
    if list_gifts.empty?
      puts "Your list is empty. Please add items before!"
    else
      puts "Which item have you bought (pick with the index)?"
      list_gifts.each_with_index do |item, index|
        status = item[:bought] ? "[X]" : "[ ]"  # Détermine le statut de l'article
        puts "#{index + 1} - #{status} #{item[:name]}"  # Affiche l'article avec son statut
      end
      item_to_mark = gets.chomp.to_i
      # Marque l'article comme acheté en mettant :bought à true
      list_gifts[item_to_mark - 1][:bought] = true
      puts "#{list_gifts[item_to_mark - 1][:name]} has been marked as bought!"  # Affiche que l'article a été marqué
    end
  # when "idea"
  #   puts "What are you searching on Etsy?"
  #   article = gets.chomp
  #   url = "https://www.etsy.com/search?q=#{article}"
  #   html_file = URI.open(url, 'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3').read
  #   # html_file = URI.open(url).read
  #   html_doc = Nokogiri::HTML.parse(html_file)
  #   etsy_gifts = []
  #   html_doc.search(".v2-listing-card__info").each do |element|
  #     # get item name
  #     etsy_name = element.search(".v2-listing-card__title").text.strip
  #     # get item price
  #     etsy_price = element.search(".currency-value").text.strip.to_i
  #     # create a gift with those information
  #     etsy_gifts << { name: etsy_name, price: etsy_price }
  #   end
  #   puts "Here are Etsy results for '#{keyword}':"
  when "quit"
    puts "Goodbye! See you next time"
    break
  else
    puts "Please choose one of the valid actions!"
  end
end
