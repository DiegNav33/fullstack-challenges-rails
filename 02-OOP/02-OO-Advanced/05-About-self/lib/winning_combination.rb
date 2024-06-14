module DemoModule
  class DemoClass
    def self.introduce
      # TODO: choose return between 1, 2, 3
      2
    end

    def introduce
      # TODO: choose return between 1, 2, 3
      3
    end
  end

  def self.introduce
    # TODO: choose return between 1, 2, 3
    1
  end
end

def winning_combination?
  first = DemoModule.introduce
  second = DemoModule::DemoClass.introduce
  third = DemoModule::DemoClass.new.introduce
  # Next line should return true!
  [first, second, third] == [1, 2, 3]
end


module MyModule
  class MyClass
    def self.class_method
      "Class method"
    end

    def instance_method
      "Instance method"
    end
  end

  def self.module_method
    "Module method"
  end
end

# Appel de la méthode de module
puts MyModule.module_method        # Affiche "Module method"

# Appel de la méthode de classe
puts MyModule::MyClass.class_method  # Affiche "Class method"

# Appel de la méthode d'instance
instance = MyModule::MyClass.new
puts instance.instance_method       # Affiche "Instance method"
