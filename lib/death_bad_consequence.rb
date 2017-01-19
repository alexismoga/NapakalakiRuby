# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'numeric_bad_consequence'
require_relative 'bad_consequence'

class DeathBadConsequence < NumericBadConsequence
  
  def initialize(atext,level, nVisible, nHidden, death)
    super(atext,level,nHidden,nVisible)
    @death=death
  end
  
  def isDeath
    return @death
  end
  
  def to_s
    return " #{@atext}"
  end
end
