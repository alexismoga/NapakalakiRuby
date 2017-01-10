# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CultistPlayer < Player
  @@totalCultistPlayers = 0
  
  def initialize(player, cultist)
    super(player)
    @myCultistCard = cultist
    @@totalCultistPlayers += 1
  end
  
  def getCombatLevel
    nivelaso = super.getCombatLevel
    porci = nivelaso * 70/100
    nivelcultis = @myCultistCard.getGainedLevels * @getTotalCultistPlayers
        
    combtL = nivelaso + porci + nivelcultis
        
    return combtL
  end
  
  def getOponentLevel(m)
    return m.getCombatLevelAgainstCultistPlayer
  end
  
  def shouldConvert
    return false
  end
  
  def giveMeATreasure
    @visibleTreasures[ rand ( @visibleTreasures.size - 1 ) ]
  end
  
  def canYouGiveMeATreasure
    tiene = false
    if(@enemy.visibleTreasures.size > 0)
      tiene = true
    end
    return tiene
  end
  
  def getTotalCultistPlayers
    return @@totalCultistPlayers
  end
  
end
