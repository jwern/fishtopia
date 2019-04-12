class Player
attr_accessor :inventory

  def initialize(inventory)
    @inventory = inventory
  end

  def have_bait?
    @inventory[:bait]
  end

  def list_fish
    @inventory[:fish]
  end

  def shop
    puts "Welcome to the shop!"
    puts "You can trade fish for bait here."
    inventory_fish = list_fish.size

    if inventory_fish <= 0
      puts "\nBut you have no fish."
    else
      puts "How much bait would you like?"

      bait_amount = gets.chomp.to_i

      if bait_amount <= inventory_fish
        @inventory[:bait] += bait_amount

        fish_traded = list_fish.sample(bait_amount)
        @inventory[:fish] = @inventory[:fish].reject { |fish| fish_traded.include?(fish) }

        puts "You now have #{list_fish.size} fish and #{have_bait?} bait."
      else
        puts "You can trade for up to #{inventory_fish} bait."
        shop
      end
    end

  end

  #def fish_caught_minigame(fish)
  #  puts "Caught a #{fish.type}!"
  #  puts FISH_1

  #  @inventory[:fish] << fish
  #end

end
