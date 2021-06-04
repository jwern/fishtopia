class Location
  attr_accessor :fish, :grid, :fish_catching_difficulty, :name

  def initialize(total_fish, fish_types, grid_size, grid_icon, name)

    @fish = rand(total_fish).times.flat_map do
      fish_types.map { |type| type.new }.shuffle
    end
    # How large the location is / how many rows/columns the player will see
    # when playing the fishing minigame
    @grid = Array.new(grid_size[0]) { Array.new(grid_size[1], grid_icon) } # https://stackoverflow.com/questions/49073229/ruby-nested-for-loop-to-populate-array-of-arrays
    # Player gets one guess in the fishing minigame
    # for every 2.5 squares on the grid
    @fish_catching_difficulty = (grid_size.reduce(&:*) / 2.5).round
    @name = name
  end
end

class River < Location

  def initialize
    fish_amount = (30..60)
    fish_types = [RiverSalmon, RiverChub, RiverTrout]
    grid_size = [4, 4]
    grid_icon = "~"
    name = "river"

    super(fish_amount, fish_types, grid_size, grid_icon, name)
  end
end

class Ocean < Location

  def initialize
    fish_amount = (45..75)
    fish_types = [OceanPorgy, OceanBream, OceanSunfish]
    grid_size = [4, 5]
    grid_icon = "^"
    name = "ocean"

    super(fish_amount, fish_types, grid_size, grid_icon, name)
  end
end

class Lake < Location

  def initialize
    fish_amount = (25..50)
    fish_types = [LakePerch, LakeWalleye, LakeBass]
    grid_size = [3, 3]
    grid_icon = "*"
    name = "lake"

    super(fish_amount, fish_types, grid_size, grid_icon, name)
  end
end
