# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure'
require_relative 'treasure_kind'

class BadConsequence
  
  attr_reader :atext, :someLevels
  
  def initialize(atext, someLevels)
    @atext = atext
    @someLevels = someLevels  
  end
  
  def isEmpty
    
  end
  
  def getLevels
    return @someLevels
  end
  
  def substractHiddenTreasure(treasure)
    
  end
  
  def substractVisibleTreasure(treasure)
    
  end
  
  def adjustToFitTreasureLists(v, h)
    
  end
  
=begin 
 
  def adjustToFitTreasureLists(v, h)
    b=nil
    if @someVisibleTreasures != 0 or @someHiddenTreasures != 0 
      if (@someVisibleTreasures >= v.length)
        nV = v.lengh
      else
        nV = @someVisibleTreasures
      end
                
      if (@someHiddenTreasures >= h.length)
        nH = h.length
      else
        nH = @someHiddenTreasures
      end
        b.newLevelNumberOfTreasures(@atext,@someLevels,nV,nH) 
                
      elsif @someSpecificHiddenTreasures.empty? or @someSpecificVisibleTreasures.empty?
        sV = Array.new
        sH = Array.new
                
        v.each { |t| 
        sV << t.type                   
        }
      intersectionV = sV & @someSpecificVisibleTreasures
                
      h.each { |t| 
        sH << t.type                   
      }
      intersectionH = sH & @someSpecificHiddenTreasures
                
      b.newLevelSpecificTreasures(@atext,@someLevels,intersectionV,intersectionH)               
    end
    return b
  end
  
=end
  def to_s
    "#{@atext}\n Niveles: #{@someLevels}\n " 
  end
end
