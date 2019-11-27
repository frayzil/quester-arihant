require "../../../angle.cr"
require "../../../vector.cr"

class Solver14
  property angle, vector

  def initialize(angle_deg, vector_ary)
    @angle = Angle.new(value: angle_deg, unit: :deg)
    @vector = Vector.new(vector_ary[0], vector_ary[1], vector_ary[2])
  end

  def solve
    (
      @angle.cos * @vector.z +
      @angle.sin * @vector.y
    ).abs
  end
end
