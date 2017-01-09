# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require 'singleton'
require_relative 'card_dealer'
require_relative 'player'
require_relative 'monster'
require_relative 'combat_result'

class Napakalaki
  include Singleton
  
  attr_accessor :currentPlayer, :players, :dealer, :currentMonster
  
  def initialize
    @players = Array.new
    @currentPlayer = nil
    @dealer = CardDealer.instance
    @currentMonster
  end
  
  private
  
  def initPlayers(names)
    i=0
    while(i<names.size)
      @players<<Player.new(names[i])
      i=i+1
    end
  end
  
  def nextPlayer
    next_p
    indice
    
    if(@currentPlayer.nil?)
      indice = rant(@players.size)
      next_p = @players.at(indice)
    else
      indice = players.indexOf(@currentPlayer)
            if(indice ==(@players.size -1) )
                next_p=@players.at(0) 
            else
                next_p=@players.at(indice+1)
            end
      end
      @currentPlayer=next_p;
      return @currentPlayer;
    end
  
  def nextTurnAllowed
    return @currentPlayer.nil? ? true : @currentPlayer.validState
  end
  
  def setEnemies
     for i in 0..(@players.size - 1) do
			aleatorio = rand(@players.size)
			
			if(i == aleatorio)
				aleatorio = rand(@players.size)
			end
			
			@players[i].enemy = Player.new(@players[aleatorio].name)
		end
  end
  
  public 
  
  def developCombat
    m = @currentMonster
    result = @currentPlayer.combat(m) # 1.1
    dealer.giveMonsterBack(m) #1.2
    
    return result
  end
  
  def discardVisibleTreasures(treasures)
    treasures.each {|t|  #1.1
      @currentPlayer.discardVisibleTreasure(t) #1.2
      dealer.giveTreasureBack(t) #1.3
    }
  end
  
  def discardHiddenTreasures(treasures)
    treasures.each {|t|  #1.1
      @currentPlayer.discardHiddenTreasure(t) #1.2
      dealer.giveTreasureBack(t) #1.3
    }
  end
  
  def makeTreasuresVisible(treasures)
    treasures.each {|t| #1.1
      @currentPlayer.makeTreasureVisible(t) #1.2   
    }
  end
  
  def initGame(players)
    initPlayers(players) #1.1
    setEnemies #1.2
    dealer.initCards #1.3
    nextTurn #1.4
  end
  
  def nextTurn
    stateOk = nextTurnAllowed #1.1
        
      if(stateOk)
        @currentMonster = dealer.nextMonster #1.2
        @currentPlayer = nextPlayer #1.3
        dead = @currentPlayer.isDead #1.4
        if(dead)
          @currentPlayer.initTreasures #1.5
        end
      end
    return stateOk #1.6
  end
  
  def endOfGame(result)
    return result == CombatResult::WINGAME
  end
  
end
