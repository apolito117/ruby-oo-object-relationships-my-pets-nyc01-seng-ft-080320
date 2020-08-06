class Owner
 attr_accessor :cat, :buy_cat, :walk_dogs
 attr_reader :name, :species
 @@all = []
  
  def initialize (name)

    @name = name
    @species = "human"
    @@all << self
  
    
  end
  
  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    Owner.all.count
  end

  def self.reset_all
    Owner.all.clear
  end

  def cats
    Cat.all.filter do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.filter do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)

    Cat.new(name,self)

  end

  def buy_dog(name)
    
    Dog.new(name,self)

  end

  def walk_dogs

    self.dogs.map do |dog|
    dog.mood = "happy"

    end
  end

  def feed_cats

    self.cats.map do |cat|
    cat.mood = "happy"

    end

  end

  def sell_pets

    self.dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end

    self.cats.each do |cat|
      cat.owner = nil
      cat.mood = "nervous"
    end
  end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

  # code goes here
end