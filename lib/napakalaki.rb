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
    index_next = 0
    n_pl = nil
    if @currentPlayer == nil
      index_next = rand(@players.size - 1)
      n_pl = @players[index_next]
    else
      index_next = @players.index(@currentPlayer)
      if index_next == @players.size - 1
          index_next = 0
      else
          index_next+=1
      end
      n_pl = @players[index_next]
    end
    @currentPlayer = n_pl
    return n_pl
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
    if result == CombatResult::LOSEANDCONVERT
      unicaInsta = @dealer.nextCultist()
      newplayer = CultistPlayer.new(@currentPlayer,unicaInsta)
      currentpind = @players.index(@currentPlayer)
      enemy = @currentPlayer.enemy
      @players.set(currentpind, newplayer)
      @currentPlayer = newplayer
      newplayer.setEnemy(enemy)
    end
    
    @dealer.giveMonsterBack(m) #1.2
    
    return result
  end
  
  def discardVisibleTreasures(treasures)
    treasures.each {|t|  #1.1
      @currentPlayer.discardVisibleTreasure(t) #1.2
      @dealer.giveTreasureBack(t) #1.3
    }
  end
  
  def discardHiddenTreasures(treasures)
    treasures.each {|t|  #1.1
      @currentPlayer.discardHiddenTreasure(t) #1.2
      @dealer.giveTreasureBack(t) #1.3
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
    @dealer.initCards #1.3
    nextTurn #1.4
  end
  
  def nextTurn
    stateOk = nextTurnAllowed #1.1
        
      if(stateOk)
        @currentMonster = @dealer.nextMonster #1.2
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
  
  def getCurrentPlayer
    return @currentPlayer
  end
  
  def getCurrentMonster
    return @currentMonster
  end
  
end
