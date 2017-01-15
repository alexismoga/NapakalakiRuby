# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'singleton'
require 'bad_consequence'
require_relative 'treasure'
require_relative 'treasure_kind'
require_relative 'monster'
require_relative 'prize'
require_relative 'cultist'

class CardDealer
  
  include Singleton
  
  private
    
  def initTreasureCardDeck
    @unusedTreasures = Array.new
    @usedTreasures = Array.new
    
    @unusedTreasures << Treasure.new("Si mi amo", 4, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Botas de incestigacion", 3, TreasureKind::SHOES)
    @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Botas de lluvia acida", 1, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Ametralladora ACME", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("El aparato de Pr.Tesla", 4, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Escopeta de 3 caniones", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Garabato mistico", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("La rebeca metalica",2,TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Lanzallamas",4, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Necro-comicon", 1, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necronomicon",5, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Linterna a 2 manos",3, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Necro-gnomicon",2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necrotelecom",2, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Mazo de los antiguos",3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necro-playboycon",3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Porra preternatural",2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Shogulador",1, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Varita de atizamiento",3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Tentacula de pega",2, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Zapato deja-amigos",1, TreasureKind::SHOES)
  end
  
  def initMonsterCardDeck
    @unusedMonsters=Array.new
    @usedMonsters=Array.new
    
    p1=Prize.new(2,1)
    b1=SpecificBadConsequence.new("Pierdes tu armadura visible y otra oculta",0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
    @unusedMonsters << Monster.newMonsterNoCultist("3 Byakhees de bonanza",8,p1,b1)

    p2=Prize.new(1,1)
    b2=SpecificBadConsequence.new("Embobados con el lindo primigenio te descartas de tu casco visible",0,[TreasureKind::HELMET],0)
    @unusedMonsters << Monster.newMonsterNoCultist("Tenochtitlan",2,p2,b2)

    p3=Prize.new(1,1)
    b3=SpecificBadConsequence.new("El primordial bostezo contagioso.Pierdes el calzado visible",0,[TreasureKind::SHOES],0)
    @unusedMonsters << Monster.newMonsterNoCultist("El sopor de Dunwich",2,p3,b3)

    p4=Prize.new(4,1)
    b4=SpecificBadConsequence.new("Te atrapan para llevarte de fiesta y dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta",0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
    @unusedMonsters << Monster.newMonsterNoCultist("Demonios de Magaluf",2,p4,b4)

    p5=Prize.new(3,1)
    b5=NumericBadConsequence.new("Pierdes todos tus tesoros visibles",0,10,0)
    @unusedMonsters << Monster.newMonsterNoCultist("El gorron en el umbral",13,p5,b5)

    p6=Prize.new(2,1)
    b6=SpecificBadConsequence.new("Pierdes la armadura visible",0,[TreasureKind::ARMOR],0)
    @unusedMonsters << Monster.newMonsterNoCultist("H.P. Munchcraft",6,p6,b6)

    p7=Prize.new(1,1)
    b7=SpecificBadConsequence.new("Sientes bichos bajo la ropa. Descarta la armadura visible",0,[TreasureKind::ARMOR],0)
    @unusedMonsters << Monster.newMonsterNoCultist("Necrofago",13,p7,b7)

    p8=Prize.new(3,2)
    b8=NumericBadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles.",5,3,0)
    @unusedMonsters << Monster.newMonsterNoCultist("El rey del rosado",11,p8,b8)

    p9=Prize.new(1,1)
    b9=NumericBadConsequence.new("Toses los pulmones y pierdes 2 niveles.",2,0,0)
    @unusedMonsters << Monster.newMonsterNoCultist("Flecher",2,p9,b9)

    p10=Prize.new(2,1)
    b10=DeathBadConsequence.new("Estos monstruos resultan bastante superficiales y te aburren mortalmente")
    @unusedMonsters << Monster.newMonsterNoCultist("Los Hondos",8,p10,b10)

    p11=Prize.new(2,1)
    b11=NumericBadConsequence.new("Pierdes 2 niveles y 2 tesoros ocultos",2,0,2)
    @unusedMonsters << Monster.newMonsterNoCultist("Semillas Cthulhu",4,p11,b11)

    p12=Prize.new(2,1)
    b12=SpecificBadConsequence.new("Te intentas escaquear. Pierdes una mano visible.",0,[TreasureKind::ONEHAND],0)
    @unusedMonsters << Monster.newMonsterNoCultist("Dameargo",1,p12,b12)

    p13=Prize.new(2,1)
    b13=NumericBadConsequence.new("Da mucho asquito. Pierdes 3 niveles.",3,0,0)
    @unusedMonsters << Monster.newMonsterNoCultist("Pollipolipo volante",3,p13,b13)

    p14=Prize.new(3,1)
    b14=DeathBadConsequence.new("No le hace gracia que pronuncien mal su nombre. Estas muerto")
    @unusedMonsters << Monster.newMonsterNoCultist("YskhtihyssgGoth",14,p14,b14)

    p15=Prize.new(3,1)
    b15=DeathBadConsequence.new("La familia te atrapa. Estas muerto")
    @unusedMonsters << Monster.newMonsterNoCultist("Familia feliz",1,p15,b15)

    p16=Prize.new(2,1)
    b16=SpecificBadConsequence.new("La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible",2,[TreasureKind::BOTHHANDS],0)
    @unusedMonsters << Monster.newMonsterNoCultist("Roboggoth",8,p16,b16)

    p17=Prize.new(1,1)
    b17=SpecificBadConsequence.new("Te asusta en la noche. Pierdes un casco visible.",0,[TreasureKind::HELMET],0)
    @unusedMonsters << Monster.newMonsterNoCultist("El espia sordo",5,p17,b17)

    p18=Prize.new(2,1)
    b18=NumericBadConsequence.new("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles",2,5,0)
    @unusedMonsters << Monster.newMonsterNoCultist("Tongue",19,p18,b18)

    p19=Prize.new(2,1)
    b19=NumericBadConsequence.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.",3,10,0)
    @unusedMonsters << Monster.newMonsterNoCultist("Bicefalo",21,p19,b19)
    
    #Cultist
    
    p20=Prize.new(3,1)
    b20=SpecificBadConsequence.new("Pierdes 1 mano visible", 0,[TreasureKind::ONEHAND], 0)
    @unusedMonsters << Monster.newMonsterCultist("El mal indecible impronunciable", 10,p20,b20,-2)
  
    p21=Prize.new(2,1)
    b21=SpecificBadConsequence.new("Pierdes tus tesoros visibles. Jajaja", 0,10, 0)
    @unusedMonsters << Monster.newMonsterCultist("Testigos Oculares", 6,p21,b21,2)
    
    p22=Prize.new(2,5)
    b22=DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres")
    @unusedMonsters << Monster.newMonsterCultist("El gran cthulhu", 20,p22,b22,4)
  
    p23=Prize.new(2,1)
    b23=NumericBadConsequence.new("Tu gobierno te recorta 2 niveles", 2,0,0)
    @unusedMonsters << Monster.newMonsterCultist("Serpiente Politico", 8,p23,b23,-2)
  
    p24=Prize.new(1,1)
    b24=SpecificBadConsequence.new("Pierdes tu casco y armadura visible. Pierdes tus manos ocultas", 0,[TreasureKind::HELMET, TreasureKind::ARMOR], 10)
    @unusedMonsters << Monster.newMonsterCultist("Felpuggoth", 2,p24,b24,5)
    
    p25=Prize.new(4,2)
    b25=NumericBadConsequence.new("Pierdes 2 niveles", 2,0,0)
    @unusedMonsters << Monster.newMonsterCultist("Shoggoth", 16,p25,b25,-4)
  
    p26=Prize.new(1,1)
    b26=NumericBadConsequence.new("Pintalabios negro. Pierdes 2 niveles", 2,0,0)
    @unusedMonsters << Monster.newMonsterCultist("El mal indecible impronunciable", 2,p26,b26,3)
  
  end
  
  def initCultistCardDeck
    @unusedCultists=Array.new
    @usedCultists=Array.new
    
    @unusedCultists << Cultist.new("El mal indecible impronunciable", -2)
    @unusedCultists << Cultist.new("Testigos Oculares", 2)
    @unusedCultists << Cultist.new("El gran cthulhu", 4)
    @unusedCultists << Cultist.new("Serpiente Politico", -2)
    @unusedCultists << Cultist.new("Felpuggoth", 5)
    @unusedCultists << Cultist.new("Shoggoth", -4)
    @unusedCultists << Cultist.new("Lolitagooth", 3)
  end
  
  def shuffleTreasures
    @unusedTreasures.shuffle
  end
  
  def shuffleMonsters
    @unusedMonsters.shuffle
  end
  
  def shuffleCultists
    @unusedCultists.shuffle
  end
  
  public
  
  def nextTreasure    
    if @unusedTreasures.empty?
      @usedTreasures.each {|usedTreasure|
        @unusedTreasures << usedTreasure
      }
      @usedTreasures.clear
      shuffleTreasures
    end
        
    devuelta = @unusedTreasures.at(0)
    @usedTreasures << devuelta
    @unusedTreasures.delete(0)
        
    return devuelta
  end
  
  def nextMonster   
    if @unusedMonsters.empty?
      @usedMonsters.each {|usedMonsters|
        @unusedMonsters << usedMonsters
      }
      @usedMonsters.clear
      shuffleMonsters
    end
        
    devuelta = @unusedMonsters.at(0)
    @usedMonsters << devuelta
    @unusedMonsters.delete(0)
        
    return devuelta
  end
  
  def nextCultist
    if @unusedCultists.empty?
      @usedCultists.each {|usedCultists|
        @unusedCultists << usedCultists
      }
      @usedCultists.clear
      shuffleCultists
    end
        
    devuelta = @unusedCultists.at(0)
    @usedCultists << devuelta
    @unusedCultists.delete(0)
        
    return devuelta
  end
  
  def giveTreasureBack(treasure)
    @usedTreasures << treasure
  end
  
  def giveMonsterBack(monster)
    @usedMonsters << monster
  end
  
  def initCards
    initTreasureCardDeck #1.3.1
    initMonsterCardDeck #1.3.2
    initCultistCardDeck
  end
  
end
