class Point
  property x, y, z
  
  def initialize(
    @x : Float64,
    @y : Float64,
    @z : Float64
  );end

  def coordinate(axis : Axis)
    return x if axis == Axis::X
    return y if axis == Axis::Y
    return z
  end
end