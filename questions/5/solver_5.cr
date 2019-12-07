class Solver5
  property quantity_1, measure_2

  def initialize(
    @quantity_1 : Quantity,
    @measure_2 : Measure)
  end

  def solve
    ((quantity_1  ** 2).dimension - measure_2.dimension)
  end

end
