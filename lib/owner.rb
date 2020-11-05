require_relative './cat.rb'
require_relative './dog.rb'

class Owner
  # code goes here
  attr_reader :name, :species, :pets
  @@all =[]

  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count()
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    my_cats = []
    Cat.all.each{|c| my_cats << c if c.owner == self}
    my_cats
  end

  def dogs
    my_dogs = []
    Dog.all.each{|d| my_dogs << d if d.owner == self}
    my_dogs
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def buy_cat(new_cat)
    Cat.new(new_cat, self)
  end

  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end


  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each{|cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    }
    self.dogs.each{|dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    }

  end

end