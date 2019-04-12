require "./requirements.rb"

class Game
  attr_accessor :world, :player, :minigame

  def initialize
    @world = World.new
    @player = player ||= Player.new({:bait => 1, :fish => []})
    @minigame = Minigame.new
  end

  def save_game
    File.open("ex45_data.yml", "w") { |file| file.write(self.to_yaml) }
  end

  def save_and_continue(last_choice)
    save_game
    puts "Game saved."
    play(last_choice)
  end

  def save_and_quit
    save_game
    puts "Game saved.  See you next time!"
    exit
  end

  def play(last_choice = "none")

    loop do
      puts "What would you like to do?"
      choice = gets.chomp.downcase

      case choice
      when "fish"
        minigame.go_fish(world, player, last_choice)
      when "shop", "buy", "sell"
        player.shop
      when "move", "relocate"
        world.move_location
      when "save"
        puts "Save and continue or save and quit?"
        save_choice = gets.chomp.downcase

        if save_choice == "continue"
          save_and_continue(last_choice)
        else
          save_and_quit
        end

      when "help"
        puts "You can say 'fish', 'move', 'shop', 'save', or 'stop.'"
      when "stop", "quit"
        puts "Would you like to save before stopping?"
        save_choice = gets.chomp.downcase

        if save_choice == "yes"
          save_and_quit
        else
          puts "Okay, we won't save. See you next time!"
          exit
        end

      else
        play(choice)
      end

    last_choice = choice
    end
  end
end

def intro
  intro = <<END
  Welcome to Fishtopia!  This is a relaxing game about catching fish.
  You can fish, move to new fishing spots, or shop for bait.
  If you get lost, just type "help".
END
end

puts ">>New Game"
puts ">>Load Game"
game_state = gets.chomp.downcase

if game_state == "load"
  game = YAML.load(File.read("ex45_data.yml"))
else
  puts intro
  game = Game.new
end

game.play
#puts game.world.game_visual(game.world.current_location.grid)
#p game.world.working_grid
#p game.world.fish_placement
#p game.world.fish_grid
#p game.world.fish_placement
#p game.world.fish_grid
#puts game.world.game_visual(game.world.play_grid)
#puts game.world.play_minigame
#p game.world.minigame_guesses("D3")
#p game.world.player_grid
#p game.world.player_grid
# game.world.select_fish
# game.world.river.fish.sample.weight
# game.play
