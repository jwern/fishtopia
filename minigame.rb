class Minigame
  attr_accessor :fish_grid, :player_grid, :fish_icon, :player_icon, :answer_key

  def initialize
    # We'll create the grids and answer key when player starts the minigame.
    @fish_grid = true
    @player_grid = true
    @fish_icon = "f"
    @player_icon = "o"
    @answer_key = true
  end

  def go_fish(world, player, last_choice)
    # If player fishes multiple times in a row, don't show the casting animation.
    if last_choice == "fish"
      still_fishing_visual
    else
      casting_visual
    end

    play_fishing_minigame(world, player)
  end

  def select_catchable_fish(world)
    # Pick a random fish from the current fishing spot as our target.
    world.current_location.fish.sample
  end

  def find_fish_length(fish)
    # Determines the number of squares on the grid a fish will occupy.
    if fish.weight < 20
      2
    elsif fish.weight < 50
      3
    else
      4
    end

  end

  def initialize_fish_grid!(world)
    # Picks the fish we'll attempt to catch and assigns it to
    # a viable spot on the current location's grid.
    chosen_fish = select_catchable_fish(world)
    fish_length = find_fish_length(chosen_fish)

    fish_location = world.current_location.grid.map(&:dup) # https://stackoverflow.com/questions/30973286/ruby-how-to-copy-the-multidimensional-array-in-new-array
    fish_direction = ["horizontal", "vertical"].sample

    if fish_direction == "horizontal"
      column = rand(0..(fish_location[0].size - fish_length))
      row = rand(0..(fish_location.size - 1))

      fish_length.times do
        fish_location[row][column] = @fish_icon
        column += 1
      end

    else
      row = rand(0..(fish_location.size - fish_length))
      column = rand(0..(fish_location[0].size - 1))

      fish_length.times do
        fish_location[row][column] = @fish_icon
        row += 1
      end

    end

    @fish_grid = fish_location
    chosen_fish
  end

  def initialize_player_grid!(world)
    # The player grid is what the player will see when making guesses.
    @player_grid = world.current_location.grid.map(&:dup)
  end

  def fishing_minigame_guesses(player_guess)
    # Checks if the player's guess hit the fish defined in initialize_fish_grid!
    # Puts the proper mark (x for miss, player_icon for hit) on the player grid.
    answer_hash = @answer_key
    wrong_answer = "x"
    first_index, second_index = player_guess.split('').reverse.map { |item| answer_hash[item] }

    if [@player_icon, wrong_answer].include?(@player_grid[first_index][second_index])
      puts "You've already revealed that square."
    elsif @fish_grid[first_index][second_index] == @fish_icon
      @player_grid[first_index][second_index] = @player_icon
      puts "\nHit! \n"
      return true
    else
      @player_grid[first_index][second_index] = wrong_answer
      puts "\nMiss! \n"
      return true
    end

  end

  def fishing_minigame_won
    # If the player grid contains the same number of "hit" icons
    # as the fish grid does fish icons, then the player has
    # hit all of the fish positions and won.
    @player_grid.flatten.count(@player_icon) == @fish_grid.flatten.count(@fish_icon)
  end

  def fishing_minigame_player_input(total_guesses, hooked_fish, player, world)
    # Takes player input and sends to fishing_minigame_guesses to confirm
    # if it's a hit or miss.  Continues to take input until player
    # runs out of guesses.
    player_guesses = total_guesses

    until player_guesses <= 0 || fishing_minigame_won
      puts player_grid_visual(@player_grid)
      square = "non"

      until square =~ (/[A-Z][\d]/) && @answer_key.keys.include?(square[0] && square[1])
        puts "Choose a square: "
        square = gets.chomp.upcase
      end

      if fishing_minigame_guesses(square)
        player_guesses -= 1
      end

    end

    puts player_grid_visual(@player_grid)

    if fishing_minigame_won
      world.minigame_fish_caught(player, hooked_fish)
    elsif player.have_bait? > 0
      puts "That was your last guess."
      puts "Would you like to spend bait on additional guesses?"
      use_bait = gets.chomp.downcase

        if use_bait == "yes"
          puts "How many more guesses would you like?"
          puts "You can get up to #{player.inventory[:bait]}."
          bait_amount = gets.chomp.to_i

          if bait_amount <= player.inventory[:bait]
            player.inventory[:bait] -= bait_amount
            fishing_minigame_player_input(bait_amount, hooked_fish, player, world)
          else
            puts "You don't have that much bait."
            puts "The fish swam away while you were learning to count."
          end

        end

    else
      puts "\nOh no, it got away."
    end

  end

  def play_fishing_minigame(world, player)
    # Does all the prep work needed to begin the minigame:
    # creating the fish and player grids, finding how many guesses player gets.
    initialize_player_grid!(world)
    hooked_fish = initialize_fish_grid!(world)
    player_guesses = world.current_location.fish_catching_difficulty

    puts "\nFind the fish to reel it in: \n"

    fishing_minigame_player_input(player_guesses, hooked_fish, player, world)
  end

  def create_answer_key(row_header, column_header)
    # Creates an answer hash based on the number of rows and columns on the
    # current location's grid.  The hash translates what the player will be
    # inputting (e.g. "A2") into readable indexes (e.g. [0, 1])
    row_keys = row_header.map.with_index { |item, index| [item, index] }.to_h # http://alanwsmith.com/convert-ruby-array-into-keys-of-new-hash
    # Hash[row_header.collect.with_index { |item, index| [item, index] } ]
    column_keys = column_header.map.with_index { |item, index| [item.to_s, index] }.to_h
    # Hash[column_header.collect.with_index { |item, index| [item.to_s, index] } ]
    @answer_key = row_keys.merge(column_keys)
  end

  def player_grid_visual(minigame_grid)
    # Creates a visual representation of the player's grid (which is otherwise
    # an array of arrays: puts each array and attaches a row and column header
    # for the player to use as answer input.
    working_grid = minigame_grid.map(&:dup)
    column_header = (1..working_grid.size).to_a
    row_header = ("A".."Z").first(working_grid[0].size)

    create_answer_key(row_header, column_header)
    #define_singleton_method("answer_key") do |argument|
    #  Hash[argument.collect.with_index { |item, index| [item, index] } ]
    #end
    row_header.unshift(" ")

    fish_grid_visual = working_grid.map { |row| row.unshift(column_header.shift).join(' ') }
    .unshift(row_header.join(' '))
  end
# Kyle suggestions:
# .map.with_index |row, i| can insert index instead of making column_array
end
