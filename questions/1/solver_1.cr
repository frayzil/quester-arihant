class Solver1
  property measure, quantity, operation

  def initialize(
    @measure : Measure,
    @quantity : Quantity,
    @operation : Symbol)
  end

  def solve
    if operation == :ratio
      measure.dimension - quantity.dimension
    else # :product
      measure.dimension + quantity.dimension
    end
  end
end
