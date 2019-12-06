class Solver7
  property measure_1, measure_2, measure_3, measure_4

  def initialize(
    @measure_1 : Measure,
    @measure_2 : Measure,
    @measure_3 : Measure,
    @measure_4 : Measure
    )
  end

  def solve
    ((measure_1 ** 2) / ( measure_2 * measure_3 * measure_4)).dimension
  end

end
