# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
  attr_reader :treasure, :level
  
  def initialize(treasure, level)
    @treasure = treasure
    @level = level
  end
  
  def to_s
    "Tesoros ganados: #{@treasure}\n Niveles ganados: #{@level}"
  end
end
