class Solver23
  property quantity : Quantity
  property measure : Measure
  
  def initialize(
    @quantity,
    @measure,
        
  );end

  def solve
    ((property_1 * property_2 ** 4).dimension)
  end
end
