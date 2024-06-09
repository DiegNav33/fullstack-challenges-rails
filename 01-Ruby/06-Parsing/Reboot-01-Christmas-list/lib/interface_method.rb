def display_list(list_gifts)
  if list_gifts.empty?
    puts "Your list is empty, please add items before!"
  else
    puts "This is your list:"
    list_gifts.each_with_index do |item, index|
      status = item[:bought] ? "[X]" : "[ ]"  # Détermine le statut de l'article
      puts "#{index + 1} - #{status} #{item[:name]}"  # Affiche l'article avec son statut
    end
  end
end

def add_item(list_gifts)
  puts "What item do you wanna add to your gift list?"
  item_to_add = gets.chomp
  # Ajoute un hachage avec :name et :bought au tableau list_gifts
  list_gifts << { name: item_to_add, bought: false }
  puts "#{item_to_add} has been added to your list"
end

def delete_item(list_gifts)
  if list_gifts.empty?
    puts "Your list is empty. Please add items before!"
  else
    display_list(list_gifts)
    puts "Which item do you want to delete (pick with the index)?"
    item_to_delete = gets.chomp.to_i
    # Supprime l'élément à l'index donné
    removed_item = list_gifts.delete_at(item_to_delete - 1)
    puts "#{removed_item[:name]} has been deleted!"  # Affiche le nom de l'article supprimé
  end
end

def mark_item(list_gifts)
  if list_gifts.empty?
    puts "Your list is empty. Please add items before!"
  else
    display_list(list_gifts)
    puts "Which item have you bought (pick with the index)?"
    item_to_mark = gets.chomp.to_i
    # Marque l'article comme acheté en mettant :bought à true
    list_gifts[item_to_mark - 1][:bought] = true
    puts "#{list_gifts[item_to_mark - 1][:name]} has been marked as bought!"  # Affiche que l'article a été marqué
  end
end

puts "> Welcome to your Christmas gift list"
list_gifts = []  # Initialisation de list_gifts comme un tableau vide

loop do
  action = ""
  while action.empty?
    puts "> Which action [list|add|delete|mark|quit]?"
    action = gets.chomp.downcase
  end

  case action
  when "list"
    display_list(list_gifts)
  when "add"
    add_item(list_gifts)
  when "delete"
    delete_item(list_gifts)
  when "mark"
    mark_item(list_gifts)
  when "quit"
    puts "Goodbye! See you next time"
    break
  else
    puts "Please choose one of the valid actions!"
  end
end
