def array_to_hash(array)
  # TODO: implement the method :)
  hash = {}
  array.each_with_index do |element, index|
    if block_given?
      key = yield(index)
      hash[key] = element
    else
      hash[index.to_s] = element
    end
  end
  hash
end


# Avec Bloc : Si un bloc est donné, le bloc est appelé avec l'index et le résultat est utilisé comme clé.
# Sans Bloc : Si aucun bloc n'est donné, l'index est converti en chaîne de caractères et utilisé comme clé.
