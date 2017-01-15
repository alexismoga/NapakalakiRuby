# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'bad_consequence'

class NumericBadConsequence < BadConsequence
  attr_reader :someVisibleTreasures, :someHiddenTreasures
  
  def initialize(atext, level, someVisible, someHidden)
    super(atext,level)
    @someVisibleTreasures = someVisible
    @someHiddenTreasures = someHidden
  end
  
  def isEmpty
    return (@someVisibleTreasures==0 && @someHiddenTreasures==0)
  end
  
  def substractVisibleTreasure(treasure)
    if (@someVisibleTreasures > 0)
      @someVisibleTreasures -= 1
    end
  end
  
  def substractHiddenTreasures(treasure)
    if (@someHiddenTreasures > 0)
      @someHiddenTreasures -= 1
    end
  end
  
  def adjustToFitTreasureLists(v, h)
    nVisible = @someVisibleTreasures
    nHidden = @someHiddenTreasures
		
    if (v.size  < @someVisibleTreasures)
	    nVisible = v.size
    end
    
    if (h.size < @someHiddenTreasures)
      nHidden = h.size();
    end 
    
    bc = NumericBadConsequence.new(@atext, 0, nVisible, nHidden)
        
    return bc;
  end
  
end
