# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure_kind.rb'

class Player
  
  attr_reader :name, :hiddenTreasures, :visibleTreasures, :level
  attr_writer :pendingBadConsequence, :enemy
  @@MAXLEVEL=10

  def initialize(name)
    @name = name
    @level=1
    @hiddenTreasures=[]
    @visibleTreasures=[]
  end
  
  private
  
  def bringToLife
    @dead=false
  end
  
  def incrementLevels(increment)
    @level += increment
  end
  
  def decrementLevels(decrement)
    @level -= decrement
    if(@level <1)
      @level=1
    end
  end
  
  def applyPrize(monster)
    nLevels = monster.getLevelsGained #1
    incrementLevels(nLevels) #2
    nTreasures = monster.getTreasuresGained #3
    if nTreasures>0
      dealer = CardDealer.instance #4
      0.upto(nTreasures) do |i|
        @hiddenTreasures.add(dealer.nextTreasure)
      end
    end
  end
  
  def applyBadConsequence(monster)
    badConsequence = monster.getBadConsequence
    nLevels = badConsequence.getLevels
    decrementLevels(nLevels)
    pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
    setPendingBadConsequence(pendingBad)
  end
  
  def canMakeTreasureVisible(treasure)
    nOnehand=0
    nBothhands=0
    nArmor=0
    nShoes=0
    nHelmet=0
    res=false
       
    @visibleTreasures.each {|t|
      if(t.getType == TreasureKind::ONEHAND)
        nOnehand = nOnehand +1
      elsif(t.getType ==  TreasureKind::BOTHHANDS)
        nBothhands = nBothhands +1 
      elsif(t.getType == TreasureKind::ARMOR)
        nArmor = nArmor + 1
      elsif(t.getType ==  TreasureKind::SHOES)
        nShoes = nShoes +1 
      else
        nHelmet = nHelmet+1
      end     
    }
    
    if ((nArmor == 0) && (treasure.getType == TreasureKind::ARMOR))
      res = true
    elsif((nOnehand < 2) && (nBothhand == 0) && (treasure.getType == TreasureKind::ONEHAND))
      res = true
    elsif((nBothhand == 0) && (nOnehand == 0) && (treasure.getType == TreasureKind::BOTHHAND))
      res = true
    elsif((nHelmet == 0) && (treasure.getType == TreasureKind::HELMET))
      res = true
    elsif((nShoes == 0) && (treasure.getType == TreasureKind::SHOE))
      res = true
    end
    
    return res;
  end
  
  def howManyVisibleTreasures(tKind)
    contador=0
    for i  in @visibleTreasures
      if(i.type == tKind)
        contador +=1
      end
    end
    return contador
  end
  
  def dieIfNoTreasures
    if(@visibleTreasures.empty? && @hiddenTreasures.empty?)
      @dead=true
    end
  end
  
  def giveMeATreasure
    random = rant(@hiddenTreasures.size)
    return @hiddenTreasures.at(random)
  end
  
  def canYouGiveMeATreasure
    return !@visibleTreasures.empty?
  end
  
  def haveStolen
    @canISteal = false
  end
  
  public
  
  def isDead
    return @dead
  end
  
  def combat(monster)
    myLevel = getCombatLevel #1.1.1
    monsterLevel = monster.getCombatLevel #1.1.2
    enemyLevel = 0
    @result
    if(!canISteal)
      dice = Dice.instance #1.1.3
      number = dice.nextNumber #1.1.4
      if(number<3)
        enemyLevel = enemy.getCombatLevel #1.1.5
        monsterLevel += enemyLevel
      end
    end
    if (myLevel>monsterLevel)
      applyPrize(monster) #1.1.6
      if(@level >=@@MAXLEVEL)
        @result=CombatResult::WINGAME
      else
        @result=CombatResult::WIN
      end
    else
        applyBadConsequence(monster) #1.1.7
        @result = CombatResult::LOSE
      end
    return  @result #1.1.10
  end
  
  def makeTreasureVisible(treasure)
    canI = canMakeTreasureVisible(treasure) #1.2.1
    if(canI)
      @visibleTreasures << treasure #1.2.2
      @hiddenTreasures.delete(treasure) #1.2.3
    end 
  end
  
  def discardVisibleTreasure(treasure)
    @visibleTreasures.delete(treasure) #1.2.1
    if((@pendingBadConsequence!=nil) && (!@pendingBadConsequence.empty?))
      @pendingBadConsequence.substactVisibleTreasures(treasure) #1.2.2
    end
    dieIfNoTreasures #1.2.3
  end
  
  def discardHiddenTreasure(treasure)
    @hiddenTreasures.delete(treasure) #1.2.1
    if((@pendingBadConsequence!=nil) && (!@pendingBadConsequence.empty?))
      @pendingBadConsequence.substactHiddenTreasures(treasure) #1.2.2
    end
    dieIfNoTreasures #1.2.3
  end
  
  def validState
    return @pendingBadConsequence.isEmpty && @hiddenTreasures.length <=4
  end
  
  def initTreasures
    dealer = CardDealer.instance
    dice = Dice.instance
    bringToLife
    treasure = dealer.nextTreasure
    @hiddenTreasures << treasure
    number = dice.nextNumber
    if (number>1)
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
    end
    if(number==6)
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
    end
  end
  
  def stealTreasure
    canI = canISteal
    treasure=nil
    if (canI)
      canYou = enemy.canYouGiveMeATreasure
      if(canYou)
        treasure = enemy.giveMeATreasure
        @hiddenTreasures << treasure
        haveStolen
      end
    end
    return treasure
  end
  
  def canISteal
    return @canISteal
  end
  
  def discardAllTreasures
    visibleaux= Array.new
    hiddenaux= Array.new
    
    #Para crear una copia de los arrays
    for i in 0..@visibleTreasures.size-1
			visibleaux << @visibleTreasures[i]
		end
		
		for i in 0..@hiddenTreasures.size-1
			hiddenaux << @hiddenTreasures[i]
		end
    
    visibleaux.each { |t|
      discardVisibleTreasure(t)
    }
    hiddenaux.each {|t|
      discardHiddenTreasure(t)
    } 
  end
  
end
