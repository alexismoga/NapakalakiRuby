# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'bad_consequence'

class SpecificBadConsequence < BadConsequence
  attr_reader :someSpecificHiddenTreasures, :someSpecificVisibleTreasures
  
  def initialize(atext, someLevels, nSVisible, nSHidden)
    super(atext,someLevels)
    @someSpecificVisibleTreasures = nSVisible
    @someSpecificHiddenTreasures = nSHidden
  end
  
  def substractVisibleTreasure(treasure)
    if(!@someSpecificVisibleTreasures.empty?)
      @someSpecificVisibleTreasures.remove(treasure.getType)
    end
  end
  
  def substractHiddenTreasure(treasure)
    if(!@someSpecificHiddenTreasures.empty?)
      @someSpecificHiddenTreasures.remove(treasure.getType)
    end
  end
  
  def isEmpty
    return (@someSpecificHiddenTreasures.empty? && @someSpecificVisibleTreasures.empty?)
  end
  
  def adjustToFitTreasureList(v, h)
			nVisibleTreasures = @someVisibleTreasures
			nHiddentreasures = @someHiddenTreasures
			specificVisible = @someSpecificVisibleTreasures
			specificHidden = @someSpecificHiddenTreasures
		
			if(v.size < @nVisibleTreasures)
				nVisibleTreasures = num_v
			end
		
			if(h.size < @nHiddenTreasures)
				nHiddenTreasures = num_h
			end
		
			for i in 0..@someSpecificVisibleTreasures.size
				if(specificVisible[i] != v[i])
					specificVisible.delete_at(i)
				
					i -= 1
				end
			end
		
			for i in 0..@someSpecificHiddenTreasures.size
				if(specificHidden[i] != h[i])
					specificHidden.delete_at(i)
				
					i -= 1
				end
			end
		
			bc = SpecificBadConsequence.new(@atext, 0, specificVisible, specificHidden)
		
			return bc	
  end
  
  def to_s
    "  #{@atext} \n\tPerderas niveles: #{@someLevels} \n\tPerderas estos tesoros especificos visibles: #{@specificVisibleTreasures} \n\tPerderas estos tesoros especificos ocultos: #{@specificHiddenTreasures}"
  end
end

