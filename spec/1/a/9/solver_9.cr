class Solver9
  property quantity_1, quantity_2, quantity_3, measure_1

  def initialize(
    @quantity_1 : Quantity,
    @quantity_2 : Quantity,
    @quantity_3 : Quantity,
    @measure_1  : Measure 
    )
  end

  def solve 
    ((quantity_1.dimension + quantity_2.dimension) - (quantity_3.dimension + measure_1.dimension) )
  end
end