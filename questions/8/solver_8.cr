class Solver8
  property measure_1, measure_2

  def initialize(
    @measure_1 : Measure,
    @measure_2 : Measure
    )
  end

  def solve
    ((measure_1 * measure_2 ** 4).dimension)
  end
end
