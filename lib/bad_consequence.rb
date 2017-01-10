# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure'
require_relative 'treasure_kind'

class BadConsequence
  
  attr_reader :atext, :somelevels, :someVisibleTreasures, :someHiddenTreasures, :death
  attr_reader :someSpecificVisibleTreasures, :someSpecificHiddenTreasures
  @@MAXTREASURES=10
  
  def initialize(atext, somelevels, someVisibleTreasures, someHiddenTreasures, 
      someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @atext = atext
    @somelevels = somelevels
    @someVisibleTreasures = someVisibleTreasures
    @someHiddenTreasures = someHiddenTreasures
    @someSpecificVisibleTreasures = Array.new(someSpecificVisibleTreasures)
    @someSpecificHiddenTreasures = Array.new(someSpecificHiddenTreasures)
    @death = death
  end
  
  def BadConsequence.newLevelNumberOfTreasures(aText, someLevels,
    someVisibleTreasures, someHiddenTreasures)
    new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,[],[], false)
  end
  
  def BadConsequence.newLevelSpecificTreasures(aText, someLevels,
    someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures, false)
  end
  
  def BadConsequence.newDeath(aText)
    new(aText,0,0,0,[],[],true)
  end
  
  def isEmpty
    return @someVisibleTreasures==0 && @someHiddenTreasures==0 && @someSpecificVisibleTreasures.empty? && @someSpecificHiddenTreasures.empty?
  end
  
  def getLevels
    return @someLevels
  end
  
  def substractHiddenTreasure(treasure)
    if !@someSpecificHiddenTreasures.empty?
            @someSpecificHiddenTreasures.delete(treasure.getType)
    elsif  @someHiddenTreasures!=0
      @someHiddenTtreasures =  @someHiddenTtreasures -1
    end
  end
  
  def substractVisibleTreasure(treasure)
    if !@someSpecificVisibleTreasures.empty?
            @someSpecificVisibleTreasures.delete(treasure.getType)
    elsif  @someVisibleTreasures!=0
      @someVisibleTtreasures =  @someVisibleTtreasures -1
    end
  end
  
  #Esta parte no la he excrito yo, la mayoría no me salía :(
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
        b.newLevelNumberOfTreasures(@atext,@somelevels,nV,nH) 
                
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
                
      b.newLevelSpecificTreasures(@atext,@somelevels,intersectionV,intersectionH)               
    end
    return b
  end
  
  def to_s
    "#{@atext}\n Niveles: #{@somelevels}\n Tesoros Visibles: #{@someVisibleTreasures}
    \nTesoros Ocultos: #{@someHiddenTreasures}\n Muerte: #{@death}
    \nSpecificVisible: #{@someSpecificVisibleTreasures}\nSpecificHidden: #{@someSpecificHiddenTreasures} " 
  end
end
