require_relative './owner.rb'
class Dog
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name
  @@all = []

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    self.class.all << self
  end

  def self.all
    @@all
  end

end