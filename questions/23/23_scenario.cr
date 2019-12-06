class Scenario23
  property quantity : Quantity
  property measure : Measure
  property answer : Unit

  def initialize(
    @quantity,
    @measure,
    @answer,
  );end

  def test
    it "should be #{@answer.to_s} " do
      calculated_answer = Solver23
                            .new(
                              variable_1: variable_1,
                              variable_2: variable_2
                            ).solve

      calculated_answer.should eq(answer)
    end
  end
end
