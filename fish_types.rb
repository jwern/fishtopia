class Fish
  attr_reader :weight, :type

  def initialize(weight, type)
    @weight = weight
    @type = type
  end
end

class RiverTrout < Fish
  def initialize
    super(rand(20..40), "trout")
  end
end

class RiverSalmon < Fish
  def initialize
    super(rand(10..50), "salmon")
  end
end

class RiverChub < Fish
  def initialize
    super(rand(15..18), "chub")
  end
end

class OceanPorgy < Fish
  def initialize
    super(rand(1..4), "porgy")
  end
end

class OceanBream < Fish
  def initialize
    super(rand(4..20), "bream")
  end
end

class OceanSunfish < Fish
  def initialize
    super(rand(500..1_000), "sunfish")
  end
end

class LakePerch < Fish
  def initialize
    super(rand(1..5), "perch")
  end
end

class LakeWalleye < Fish
  def initialize
    super(rand(15..30), "walleye")
  end
end

class LakeBass < Fish
  def initialize
    super(rand(5..25), "bass")
  end
end
