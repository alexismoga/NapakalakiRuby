# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "prize.rb"
require_relative "bad_consequence.rb"

class Monster
  attr_reader :name, :combatLevel, :prize, :bad
  
  def initialize(name, combatLevel, prize, bad)
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @bad = bad
  end
  
  def getLevelsGained
    return @prize.level
  end
  
  def getTreasuredGained
    return @prize.treasure
  end
  
  def to_s
    "Nombre: #{@name}\nNivel de combate: #{@commbatLevel}\n
    Prize: #{@prize}\n BadConsequence: #{@bad}"
  end
end
