class Mother
  # Initialiser une variable de classe pour suivre les descendants
  @@descendants = []

  # La méthode inherited est appelée chaque fois qu'une sous-classe est créée
  def self.inherited(subclass)
    @@descendants << subclass
  end

   # Définir la méthode phone_kids pour appeler la méthode phone sur chaque descendant
  def self.phone_kids
    # Itérer sur les descendants et appeler la méthode phone
    @@descendants.each do |descendant|
      descendant.phone if descendant.respond_to?(:phone)
    end
  end
end

# Daughter and Son are classes inheriting from Mother. They are defined
# in the specs, no need to create them.
