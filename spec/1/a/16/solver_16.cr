require"../../../../axis.cr"
require"../../../../point.cr"

class Solver16
  @axis : Axis
  @point : Point

  def initialize(axis, point_ary)
    @axis = Axis.with(name: axis)
    @point = Point.new(point_ary[0], point_ary[1], point_ary[2])
  end

  def solve
    axes = Axis::ALL.dup
    axes.delete(@axis)

    Math.sqrt(axes.map{ |axis| @point.coordinate(axis: axis) ** 2 }.sum)
  end
end
