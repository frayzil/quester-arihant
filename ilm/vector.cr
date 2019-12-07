class Vector
  property x, y, z

  def initialize(
    @x : Float64,
    @y : Float64,
    @z : Float64
  ); end

  def *(number : Float64)
    Vector.new(x * number, y * number, z * number)
  end

  def /(number : Float64)
    Vector.new(x / number, y / number, z / number)
  end

  def unit_vector
    self / magnitude
  end

  def magnitude
    Math.sqrt(x**2 + y**2 + z**2)
  end

  def to_s
    "#{x} i + #{y} j + #{z} k"
  end
end
