# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure_kind'

class Treasure
  attr_reader :name, :bonus, :type
  
  def initialize(n, bonus, t)
    @name=n
    @bonus=bonus
    @type=t
  end
  
  def getType
    return @type
  end
  
  def to_s
    "Nombre: #{@name}\nBonus: #{@bonus}\nType: #{@type}"
  end
end
