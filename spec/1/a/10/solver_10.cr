class Solver10
  property quantity_1, quantity_2, quantity_3

  def initialize(
    @quantity_1 : Quantity,
    @quantity_2 : Quantity,
    @quantity_3 : Quantity
    )
  end

  def solve 
    (quantity_1 ** 2).dimension - ((quantity_1 ** 2).dimension - (quantity_2.dimension + quantity_3.dimension))
  end
end
