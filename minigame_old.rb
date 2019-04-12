# river_fish = [
#  <RiverChub:0x0000000002e5b788 @weight=18, @type="chub">,
#  <RiverTrout:0x0000000002e5b710 @weight=39, @type="trout">,
#  <RiverSalmon:0x0000000002e5b7d8 @weight=42, @type="salmon">,
#  <RiverTrout:0x0000000002e5b558 @weight=22, @type="trout">,
#  <RiverSalmon:0x0000000002e5b620 @weight=41, @type="salmon">,
#  <RiverChub:0x0000000002e5b5a8 @weight=15, @type="chub">,
#  <RiverChub:0x0000000002e5b440 @weight=17, @type="chub">,
#  <RiverSalmon:0x0000000002e5b490 @weight=34, @type="salmon">,
#  <RiverTrout:0x0000000002e5b3f0 @weight=27, @type="trout">]

def select_fish(fish_collection)
  fish_collection.sample
end

def find_fish_length(fish)
  if fish.weight < 20
    2
  elsif fish.weight < 50
    3
  else
    4
  end
end

def fish_placement(location_grid, fish_collection)

  chosen_fish = select_fish(fish_collection)
  fish_length = find_fish_length(chosen_fish)

  fish_location = location_grid.map(&:dup) # https://stackoverflow.com/questions/30973286/ruby-how-to-copy-the-multidimensional-array-in-new-array
  fish_direction = ["horizontal", "vertical"].sample
  fish_icon = "f"

  ####### Kyle's version with hash (not tested) - doesn't shorten much
  #length_modifier = {
  #  horizontal: fish_direction == 'horizontal' ? fish_length : 1,
  #  vertical: fish_direction == 'vertical' ? fish_length : 1
  #}
  #
  #column = rand(0..(fish_location[0].size - length_modifier[:vertical]))
  #row = rand(0..(fish_location.size - length_modifier[:horizontal))

  #fish_length.times do
  #  fish_location[row][column] = "f"
  #  fish_direction == 'horizontal' ? column += 1 : row += 1
  #end
  #######

  if fish_direction == "horizontal"
    column = rand(0..(fish_location[0].size - fish_length))
    row = rand(0..(fish_location.size - 1))

    fish_length.times do
      fish_location[row][column] = fish_icon
      column += 1
    end

  else
    row = rand(0..(fish_location.size - fish_length))
    column = rand(0..(fish_location[0].size - 1))

    fish_length.times do
      fish_location[row][column] = fish_icon
      row += 1
    end

  end

fish_location

end

def game_visual(fish_grid)
  fish_grid_visual = fish_grid.map { |row| row.join(' ') }
  puts fish_grid_visual
  #puts fish_grid[0].join(' ')
  #puts fish_grid[1].join(' ')
  #puts fish_grid[2].join(' ')
  #puts fish_grid[3].join(' ')
end




  #location_grid[rand(0..location_grid.size - 1)] = valid_fish_v

  #p location_grid.transpose
  #x_starting_point = rand(0..(location_grid[0].size - fish_length)) # 0
  #y_starting_point = rand(0..(location_grid.size - 1)) # 3
  #to_increment = ["x", "y"].sample # "y"

  #fish_location = location_grid.map do |row|
  #  if to_increment == "x"
  #    location_grid[x_starting_point][y_starting_point] = "f"
  #fish_location = fish_length.times.map do
  #  location_grid.map do |row|

   #river_fish = [
     #<RiverSalmon:0x0000000002dc74c0 @weight=49, @type="salmon">, #<RiverTrout:0x0000000002dc7420 @weight=34, @type="trout">, #<RiverChub:0x0000000002dc7470 @weight=15, @type="chub">, #<RiverTrout:0x0000000002dc72b8 @weight=32, @type="trout">, #<RiverChub:0x0000000002dc7308 @weight=17, @type="chub">, #<RiverSalmon:0x0000000002dc7358 @weight=40, @type="salmon">, #<RiverChub:0x0000000002dc71a0 @weight=15, @type="chub">, #<RiverTrout:0x0000000002dc7150 @weight=38, @type="trout">, #<RiverSalmon:0x0000000002dc71f0 @weight=36, @type="salmon">, #<RiverTrout:0x0000000002dc6fe8 @weight=38, @type="trout">, #<RiverSalmon:0x0000000002dc70b0 @weight=20, @type="salmon">, #<RiverChub:0x0000000002dc7060 @weight=17, @type="chub">, #<RiverTrout:0x0000000002dc6ea8 @weight=29, @type="trout">, #<RiverChub:0x0000000002dc6ef8 @weight=17, @type="chub">, #<RiverSalmon:0x0000000002dc6f48 @weight=16, @type="salmon">, #<RiverChub:0x0000000002dc6d90 @weight=15, @type="chub">, #<RiverSalmon:0x0000000002dc6de0 @weight=11, @type="salmon">, #<RiverTrout:0x0000000002dc6cc8 @weight=28, @type="trout">, #<RiverSalmon:0x0000000002dc6bd8 @weight=36, @type="salmon">, #<RiverChub:0x0000000002dc6b88 @weight=17, @type="chub">, #<RiverTrout:0x0000000002dc6ac0 @weight=25, @type="trout">, #<RiverChub:0x0000000002dc6980 @weight=16, @type="chub">, #<RiverTrout:0x0000000002dc6930 @weight=39, @type="trout">, #<RiverSalmon:0x0000000002dc69d0 @weight=39, @type="salmon">, #<RiverSalmon:0x0000000002dc67c8 @weight=48, @type="salmon">, #<RiverChub:0x0000000002dc66b0 @weight=17, @type="chub">, #<RiverTrout:0x0000000002dc6660 @weight=21, @type="trout">]

##location_grid = [
  #  ["~", "~", "~", "~"],
  #  ["~", "~", "~", "~"],
  #  ["~", "~", "~", "~"],
  #  ["~", "~", "~", "~"]
  #]

#fish_weight = 10

#game_visual(fish_placement(location_grid, fish_weight))

# one axis must stay the same
# the other must increment by 1 at a time

#
#  valid_fish = [
#    ["f", "f", "f", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "]
#  ]
#
#  [x][y]
#  [x][y + 1]
#  [x][y + 2]
#
#  valid_fish[0][0]
#  valid_fish[0][1]
#  valid_fish[0][2]
#
#  valid_fish_2 = [
#    ["f", " ", " ", " "],
#    ["f", " ", " ", " "],
#    ["f", " ", " ", " "],
#    [" ", " ", " ", " "]
#  ]
#
#  [x][y]
#  [x + 1][y]
#  [x + 2][y]
#
#  valid_fish_2[0][0]
#  valid_fish_2[1][0]
#  valid_fish_2[2][0]
#
#  valid_fish_3 = [
#    [" ", " ", " ", " "],
#    [" ", "f", " ", " "],
#    [" ", "f", " ", " "],
#    [" ", " ", " ", " "]
#  ]
#
#  [x][y]
#  [x + 1][y]
#
#  valid_fish_3[1][1]
#  valid_fish_3[2][1]
#
#  valid_fish_4 = [
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", "f", "f"],
#    [" ", " ", " ", " "]
#  ]
#
#  [x][y]
#  [x][y + 1]
#
#  valid_fish_4[2][2]
#  valid_fish_4[2][3]
#
#  valid_fish_5 = [
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", "f", "f", "f"]
#  ]
#
#  [x][y]
#  [x][y + 1]
#  [x][y + 2]
#
#  valid_fish_5[3][1]
#  valid_fish_5[3][2]
#  valid_fish_5[3][3]
## ------------------------------ #
#
#  invalid_fish = [
#    ["f", " ", " ", " "],
#    [" ", "f", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "]
#  ]
#
#  [x][y]
#  [x + 1][y + 1]
#
#  invalid_fish[0][0]
#  invalid_fish[1][1]
#
#  invalid_fish_2 = [
#    ["f", " ", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "],
#    ["f", " ", " ", " "]
#  ]
#
#  [x][y]
#  [x][y + 3]
#
#  invalid_fish_2[0][0]
#  invalid_fish_2[0][3]
#
#  invalid_fish_3 = [
#    ["f", " ", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", " ", "f"]
#  ]
#
#  [x][y]
#  [x + 3][y + 3]
#
#  invalid_fish_3[0][0]
#  invalid_fish_3[3][3]
#
#  invalid_fish_4 = [
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "],
#    [" ", " ", " ", " "],
#    ["f", " ", "f", " "]
#  ]
#
#  [x][y]
#  [x][y + 2]
#
#  invalid_fish_4[3][0]
#  invalid_fish_4[3][2]
#
