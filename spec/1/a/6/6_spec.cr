require "spec"
require "./solver_6.cr"

require "../../../../measure.cr"
require "../../../../dimension.cr"
require "../../../../quantity.cr"

describe Solver6 do
  settings = [
    {
      quantity_1: Quantity::ANGULAR_MOMENTUM,
      quantity_2: Quantity::MAGNETIC_MOMENT,
      answer: Dimension.from_s("M1T-1I-1")
    }
  ]

  settings.each do |setting|
    Scenario6.new(
      quantity_1: setting[:quantity_1],
      quantity_2: setting[:quantity_2],
      answer: setting[:answer],
    ).test
  end
end

class Scenario6
  property quantity_1, quantity_2, answer

  def initialize(
    @quantity_1 : Quantity,
    @quantity_2 : Quantity,
    @answer : Dimension
  );end

  def test
    it "should be #{answer.to_s} "\
       "if quantity_1 is #{quantity_1.to_s} and "\
       "quantity_2 is #{quantity_2.to_s}" do
      calculated_answer = Solver6
                            .new(
                              quantity_1: quantity_1,
                              quantity_2: quantity_2,
                            ).solve

      calculated_answer.to_s.should eq(answer.to_s)
    end
  end
end
