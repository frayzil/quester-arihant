class Solver23_1
  property quantity_1 : Quantity
  property quantity_2 : Quantity
  property quantity_3 : Quantity
  
  def initialize(
    @quantity_1,
    @quantity_2,
    @quantity_3,
        
  );end

  def solve
    #
    if quantity_1.dimension == quantity_2.dimension &&
       quantity_2.dimension == quantity_3.dimension
      "yes"
    else
      "no"
    end

  end
end
