class Scenario23_1
  property quantity_1 : Quantity
  property quantity_2 : Quantity
  property quantity_3 : Quantity
  property selected : String
  
  def initialize(
    @quantity_1,
    @quantity_2,
    @quantity_3,
    @selected,
    
  );end

  def test
    it "should pass" do
      solver = Solver23_1.new(
        quantity_1: quantity_1,
        quantity_2: quantity_2,
        quantity_3: quantity_3,
        
      )

      answer = solver.solve

      answer.should eq(selected)
    end
  end
end
