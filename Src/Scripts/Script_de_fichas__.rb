################################################################################
## Script de Cassino feito pelo LanLan du site www.lanlangames.tk
## Adapitado para fichas por Cold
################################################################################

=begin
-->Intruçoes
Para adicionar fichas faça isso:
$game_party.gain_fichas(n) onde n é a quantidade de fichas

Para excluir fichas faça isto 
$game_party.gain_fichas(-n) onde -n é a quantidade de fichas a ser 
excluida

Para chamar a loja por que vende por fichas apenas ative a switch 
configurada(ela será comfigurada logo abaixo) que ela desativa 
sozinha depois que vc sair da loja por fichas
=end

#==============================================================================
# Module Cold
#------------------------------------------------------------------------------
# Aki é configurada algumas coisas das fichas.
#==============================================================================

module Cold
  #Aqui é quanto de gold vale uma ficha padrão 20
  Preço_das_fichas = 20
  
  #aki é a posição x da janela que mostra as fichas
  Window_Fichas_x = 80
  
  #aki é a posição y da janela que mostra as fichas
  Window_Fichas_y = 32
  
  #Aki é qual switch você usa para ativar a loja por fichas
  Switch_que_ativa_o_uso_da_loja_por_fichas = 185
end  

#==============================================================================
# Classes alteradas
#==============================================================================

class Game_Party
  attr_reader   :fichas
  alias cold_initialize initialize
  def initialize
    cold_initialize
    @fichas = 0
  end
  def gain_fichas(n)
    @fichas = [[@fichas + n, 0].max, 9999999 / Cold::Preço_das_fichas].min
  end
  def lose_fichas(n)
    gain_fichas(-n)
  end
end

module RPG
  class Weapon
    alias cold_initialize initialize
    def initialize
      @pricefichas = 0
    end
     attr_accessor :pricefichas
  end
  class Item
    alias cold_initialize initialize
    def initialize
      @pricefichas = 0
    end
     attr_accessor :pricefichas
  end
  class Armor
    alias cold_initialize initialize
    def initialize
      @pricefichas = 0
    end
     attr_accessor :pricefichas
  end
end

class Scene_Map
  def call_shop
    $game_temp.shop_calling = false
    $game_player.straighten
    if $game_switches[Cold::Switch_que_ativa_o_uso_da_loja_por_fichas]
      $scene = Scene_ShopFichas.new
      $game_switches[Cold::Switch_que_ativa_o_uso_da_loja_por_fichas] = false
    else
      $scene = Scene_Shop.new
    end
  end
end

#==============================================================================
#  Fim das Classes alteradas
#==============================================================================

#==============================================================================
# Window_Fichas
#------------------------------------------------------------------------------
# Janela que exibe as fichas
#==============================================================================

class Window_Fichas < Window_Base
  def initialize
    super(Cold::Window_Fichas_x, Cold::Window_Fichas_y, 160, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
        self.contents.font.name = $fontface
    self.contents.font.size = $fontsize
    refresh
  end
  def refresh
    self.contents.clear
    cx = contents.text_size("Tokens ").width
    self.contents.font.color = normal_color
    self.contents.draw_text(4, 0, 120-cx-2, 32, $game_party.fichas.to_s, 2)
    self.contents.font.color = system_color
    self.contents.draw_text(124-cx, 0, cx, 32, "Tokens ", 2)
  end
end

#==============================================================================
# Window_ShopNumberFichas
#------------------------------------------------------------------------------
# É a janela em que se escolhe o número de Itens a se comprar na 
# loja por fichas.
#==============================================================================

class Window_ShopNumberFichas < Window_Base
  def initialize
    super(0, 128, 368, 352)
    self.contents = Bitmap.new(width - 32, height - 32)
       self.contents.font.name = $fontface
    self.contents.font.size = $fontsize
    @item = nil
    @max = 1
    @price = 0
    @pricefichas = 0
    @number = 1
  end
  def set(item, max, price, pricefichas)
    @item = item
    @max = max
    @price = price 
    @pricefichas = pricefichas
    @number = 1
    refresh
  end
  def number
    return @number
  end
  def refresh
    self.contents.clear
    draw_item_name(@item, 4, 96)
    self.contents.font.color = normal_color
    self.contents.draw_text(272, 96, 32, 32, "~")
    self.contents.draw_text(308, 96, 24, 32, @number.to_s, 2)
    self.cursor_rect.set(304, 96, 32, 32)
    domination = "Tokens"
    cx = contents.text_size(domination).width
    total_price = @pricefichas * @number
    self.contents.font.color = normal_color
    self.contents.draw_text(4, 160, 328-cx-2, 32, total_price.to_s, 2)
    self.contents.font.color = system_color
    self.contents.draw_text(332-cx, 160, cx, 32, domination, 2)
  end
  def update
    super
    if self.active
      if Input.repeat?(Input::RIGHT) and @number < @max
        $game_system.se_play($data_system.cursor_se)
        @number += 1
        refresh
      end
      if Input.repeat?(Input::LEFT) and @number > 1
        $game_system.se_play($data_system.cursor_se)
        @number -= 1
        refresh
      end
      if Input.repeat?(Input::UP) and @number < @max
        $game_system.se_play($data_system.cursor_se)
        @number = [@number + 10, @max].min
        refresh
      end
      if Input.repeat?(Input::DOWN) and @number > 1
        $game_system.se_play($data_system.cursor_se)
        @number = [@number - 10, 1].max
        refresh
      end
    end
  end
end

#==============================================================================
# Window_ShopBuyFichas
#------------------------------------------------------------------------------
# É a lista de mercadorias a serem mostradas em uma venda.
#==============================================================================

class Window_ShopBuyFichas < Window_Selectable
  def initialize(shop_goods)
    super(0, 128, 368, 352)
    @shop_goods = shop_goods
    refresh
    self.index = 0
    @price = item.price
  end
  def item
    return @data[self.index]
  end
  def refresh
    if self.contents != nil
      self.contents.dispose
      self.contents = nil
    end
    @data = []
    for goods_item in @shop_goods
      case goods_item[0]
      when 0
        @data.push($data_items[goods_item[1]])
      when 1
        @data.push($data_weapons[goods_item[1]])
      when 2
        @data.push($data_armors[goods_item[1]])
      end
    end
    @item_max = @data.size
    if @item_max > 0
      self.contents = Bitmap.new(width - 32, row_max * 32)
          self.contents.font.name = $fontface
    self.contents.font.size = $fontsize
      for i in 0...@item_max
        draw_item(i)
      end
    end
  end
  def draw_item(index)
    item = @data[index]
    case item
    when RPG::Item
      number = $game_party.item_number(item.id)
      $data_items[item.id].pricefichas = item.price / Cold::Preço_das_fichas
    when RPG::Weapon
      number = $game_party.weapon_number(item.id)
      $data_weapons[item.id].pricefichas = item.price / Cold::Preço_das_fichas
    when RPG::Armor
      number = $game_party.armor_number(item.id)
      $data_armors[item.id].pricefichas = item.price / Cold::Preço_das_fichas
    end
    if item.price <= $game_party.fichas and number < 99
      self.contents.font.color = normal_color
    else
      self.contents.font.color = disabled_color
    end
    @pricefichas = item.pricefichas
    x = 4
    y = index * 32
    rect = Rect.new(x, y, self.width - 32, 32)
    self.contents.fill_rect(rect, Color.new(0, 0, 0, 0))
    bitmap = RPG::Cache.icon(item.icon_name)
    opacity = self.contents.font.color == normal_color ? 255 : 128
    eprice = @price
    self.contents.blt(x, y + 4, bitmap, Rect.new(0, 0, 24, 24), opacity)
    self.contents.draw_text(x + 28, y, 212, 32, item.name, 0)
    self.contents.draw_text(x + 240, y, 88, 32, @pricefichas.to_s, 2)
  end
  def update_help
    @help_window.set_text(self.item == nil ? "" : self.item.description)
  end
end

#==============================================================================
# Window_ShopCommandFichas
#------------------------------------------------------------------------------
# Janela de seleção de tipo de negócio em uma loja por fichas.
#==============================================================================

class Window_ShopCommandFichas < Window_Selectable
  def initialize
    super(0, 64, 480, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
       self.contents.font.name = $fontface
    self.contents.font.size = $fontsize
    @item_max = 2
    @column_max = 3
    @commands = ["Buy", "Exist"]
    refresh
    self.index = 0
  end
  def refresh
    self.contents.clear
    for i in 0...@item_max
      draw_item(i)
    end
  end
  def draw_item(index)
    x = 4 + index * 200
    self.contents.draw_text(x, 0, 200, 32, @commands[index])
  end
end

#==============================================================================
# Scene_ShopFichas
#------------------------------------------------------------------------------
# Esta classe processa a tela da Loja por fichas.
#==============================================================================

class Scene_ShopFichas
  def main
    @help_window = Window_Help.new
    @command_window = Window_ShopCommandFichas.new
    @fichas_window = Window_Fichas.new
    @fichas_window.x = 480
    @fichas_window.y = 64
    @dummy_window = Window_Base.new(0, 128, 640, 352)
    @buy_window = Window_ShopBuyFichas.new($game_temp.shop_goods)
    @buy_window.active = false
    @buy_window.visible = false
    @buy_window.help_window = @help_window
    @number_window = Window_ShopNumberFichas.new
    @number_window.active = false
    @number_window.visible = false
    @status_window = Window_ShopStatus.new
    @status_window.visible = false
    Graphics.transition
    loop do
      Graphics.update
      Input.update
      update
      if $scene != self
        break
      end
    end
    Graphics.freeze
    @help_window.dispose
    @command_window.dispose
    @fichas_window.dispose
    @dummy_window.dispose
    @buy_window.dispose
    @number_window.dispose
    @status_window.dispose
  end
  def update
    @help_window.update
    @command_window.update
    @fichas_window.update
    @dummy_window.update
    @buy_window.update
    @number_window.update
    @status_window.update
    if @command_window.active
      update_command
      return
    end
    if @buy_window.active
      update_buy
      return
    end
    if @number_window.active
      update_number
      return
    end
  end
  def update_command
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      $scene = Scene_Map.new
      return
    end
    if Input.trigger?(Input::C)
      case @command_window.index
      when 0  
        $game_system.se_play($data_system.decision_se)
        @command_window.active = false
        @dummy_window.visible = false
        @buy_window.active = true
        @buy_window.visible = true
        @buy_window.refresh
        @status_window.visible = true
      when 1  
        $game_system.se_play($data_system.decision_se)
        $scene = Scene_Map.new
      end
      return
    end
  end
  def update_buy
    @status_window.item = @buy_window.item
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @command_window.active = true
      @dummy_window.visible = true
      @buy_window.active = false
      @buy_window.visible = false
      @status_window.visible = false
      @status_window.item = nil
      @help_window.set_text("")
      return
    end
    if Input.trigger?(Input::C)
      @item = @buy_window.item
      if @item == nil or @item.pricefichas > $game_party.fichas
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      case @item
      when RPG::Item
        number = $game_party.item_number(@item.id)
      when RPG::Weapon
        number = $game_party.weapon_number(@item.id)
      when RPG::Armor
        number = $game_party.armor_number(@item.id)
      end
      if number == 99
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      $game_system.se_play($data_system.decision_se)
      max = @item.pricefichas == 0 ? 99 : $game_party.fichas / @item.pricefichas
      max = [max, 99 - number].min
      @buy_window.active = false
      @buy_window.visible = false
      @number_window.set(@item, max, @item.price, @item.pricefichas)
      @number_window.active = true
      @number_window.visible = true
    end
  end
  def update_number
    if Input.trigger?(Input::B)
      $game_system.se_play($data_system.cancel_se)
      @number_window.active = false
      @number_window.visible = false
      @buy_window.active = true
      @buy_window.visible = true
      return
    end
    if Input.trigger?(Input::C)
      $game_system.se_play($data_system.shop_se)
      @number_window.active = false
      @number_window.visible = false
        $game_party.lose_fichas(@number_window.number * @item.pricefichas)
        case @item
        when RPG::Item
          $game_party.gain_item(@item.id, @number_window.number)
        when RPG::Weapon
          $game_party.gain_weapon(@item.id, @number_window.number)
        when RPG::Armor
          $game_party.gain_armor(@item.id, @number_window.number)
        end
        @fichas_window.refresh
        @buy_window.refresh
        @status_window.refresh
        @buy_window.active = true
        @buy_window.visible = true
      return
    end
  end
end