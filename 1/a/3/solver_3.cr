class Solver3
  property quantity_1, quantity_2

  def initialize(
    @quantity_1 : Quantity,
    @quantity_2 : Quantity)
  end

  def solve
    quantity_1 / quantity_2
  end
end
