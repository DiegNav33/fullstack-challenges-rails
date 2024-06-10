class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :age, :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
    @dead = false
  end

  def dead?
    @dead
  end

  def one_year_passes!
    @age += 1
    grow!
    produce_fruits!
    may_die!
  end

  def pick_a_fruit!
    if @fruits > 0
      @fruits -= 1
    else
      puts "There is no more fruits to pick up !"
    end
  end

  private

  def grow!
    if @age <=10
      @height += 1
    end
  end

  def produce_fruits!
    if @age >= 15
      @fruits = 0
    elsif @age >= 10
      @fruits = 200
    elsif @age > 5
      @fruits = 100
    else
      @fruits = 0
    end
  end

  def may_die!
    if @age >= 100
      @dead = true
    elsif @age >= 50
     # Vérifie si l'âge de l'oranger est de 50 ans ou plus
      # Calcule la probabilité de mort. La probabilité est de 1% (0.01) pour chaque année au-delà de 49 ans.
      # Par exemple, à 50 ans, la probabilité est de 1%, à 51 ans elle est de 2%, etc.
      probability_of_dying = 0.01 * (@age - 49)

      # Génère un nombre aléatoire entre 0 et 1.
      # Par exemple, rand peut générer 0.05, 0.2, 0.8, etc.
      random_number = rand

      # Compare le nombre aléatoire à la probabilité de mort.
      # Si le nombre aléatoire est inférieur à la probabilité calculée, l'oranger meurt.
      # Par exemple, si probability_of_dying est 0.06 (6%) et que random_number est 0.05, l'oranger meurt.
      if random_number < probability_of_dying
        #L'utilisation de la comparaison random_number < probability_of_dying est une convention courante en programmation pour #simuler des événements probabilistes. Cette méthode est intuitive car elle correspond directement à la notion de #probabilité
        #Lorsque probability_of_dying augmente, la probabilité que rand < probability_of_dying soit vraie augmente également. #C'est intuitif car une probabilité de 0.8 (80%) signifie que nous voulons que l'événement se produise 80% du temps.

        # Marque l'oranger comme mort en définissant la variable @dead à true.
        @dead = true
      end
    end
  end
end
