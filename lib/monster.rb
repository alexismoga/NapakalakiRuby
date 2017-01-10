# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative "prize.rb"
require_relative "bad_consequence.rb"

class Monster
  attr_reader :name, :combatLevel, :prize, :bad, :levelChangeAgainstCultistPLayer
  
  def initialize(name, combatLevel, prize, bad ,lc)
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @bad = bad
    @levelChangeAgainstCultistPlayer = lc
  end
  
  def self.newMonsterNoCultist(name, combatLevel, prize, bad)
    new(name, combatLevel, prize, bad, 0)
  end
  
  def self.newMonsterCultist(name, combatLevel, prize, bad, lC)
    new(name, combatLevel, prize, bad, lC)
  end
  
  def getLevelsGained
    return @prize.level
  end
  
  def getCombatLevel
    return @combatLevel
  end
  
  def getBadConsequence
    return @bad
  end
  
  def getTreasuredGained
    return @prize.treasure
  end
  
  def getCombatLevelAgainstCultistPlayer
    return @combatLevel + @levelChangeAgainstCultistPlayer
  end
  
  def to_s
    "Nombre: #{@name}\nNivel de combate: #{@combatLevel}\n
    Prize: #{@prize}\n BadConsequence: #{@bad}"
  end
end
