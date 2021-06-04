class World
  attr_accessor :river, :ocean, :current_location

  def initialize
    @river = River.new
    @ocean = Ocean.new
    @lake = Lake.new
    @current_location = @river
  end

  def move_location
    puts "You are currently at the #{@current_location.name}."
    puts "Where would you like to go?"
    move_to = gets.chomp.downcase.prepend("@").to_sym

    if self.instance_variables.include?(move_to)
      @current_location = self.instance_variable_get(move_to)
      welcome_graphic
    else
      move_location
    end
    #if move_to.include?("river")
    #  @current_location = @river
    #  welcome_graphic
    #elsif move_to.include?("ocean")
    #  @current_location = @ocean
    #  welcome_graphic
    #else
    #  move_location
    #end

  end

  def welcome_graphic
    puts "You are now at the #{@current_location.name}."
  end

  def minigame_fish_caught(player, caught)
    puts "Caught a #{caught.type}!"
    puts FISH_1

    player.inventory[:fish] << caught
    @current_location.fish.delete(caught)
  end

  #def caught_fish?(player)
  #  catch_chance = rand((6 + player.have_bait?)..10)

  #  if catch_chance >= 7
  #    fish_caught(player)
  #  else
  #    puts "Darn, just garbage."
  #    puts GARBAGE
  #  end

  #end

  #def fish_caught(player)
  #  caught = @current_location.fish.sample

  #  puts "Caught a #{caught.type}!"
  #  puts FISH_1

  #  player.inventory[:fish] << caught
  #  @current_location.fish.delete(caught)

  #  if player.have_bait? > 0
  #    player.inventory[:bait] -= 1
  #  end

  #end

end
