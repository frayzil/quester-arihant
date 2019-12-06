class Solver12
  property measure_1, measure_2

  def initialize(
    @measure_1 : Measure,
    @measure_2 : Measure
    )
  end

  def solve 
    (measure_1.dimension + measure_2.dimension)
  end
end
