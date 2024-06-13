class UberHash

  def initialize
    @properties = {}
  end

  def method_missing(method_name, *args)
    property_name = method_name.to_s
    if property_name.end_with?("=")
      # Si le nom de la méthode se termine par "=", c'est une définition de propriété
      property_name_without_equal = property_name.chomp("=")
      @properties[property_name_without_equal] = args.first
    else
      # Sinon, c'est un accès à une propriété
      @properties[method_name.to_s]
    end
  end
end
