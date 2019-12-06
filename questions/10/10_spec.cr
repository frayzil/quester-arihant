require "spec"
require "./solver_10.cr"

require "../../measure.cr"
require "../../dimension.cr"
require "../../quantity.cr"

describe Solver10 do
  settings = [
    {
      quantity_1: Quantity::TIME,
      quantity_2: Quantity::PRESSURE,
      quantity_3: Quantity::LENGTH,
      answer: Dimension.from_s("M1T-2")
    },
    {
      quantity_1: Quantity::FREQUENCY,
      quantity_2: Quantity::ANGULAR_ACCELERATION,
      quantity_3: Quantity::INDUCTANCE,
      answer: Dimension.from_s("M1L2T-4I-2")
    }
  ]

  settings.each do |setting|
    Scenario10.new(
      quantity_1: setting[:quantity_1],
      quantity_2: setting[:quantity_2],
      quantity_3: setting[:quantity_3],
      answer: setting[:answer],
    ).test
  end
end

class Scenario10
  property quantity_1, quantity_2, quantity_3, answer

  def initialize(
    @quantity_1 : Quantity,
    @quantity_2 : Quantity,
    @quantity_3 : Quantity,
    @answer : Dimension
  );end

  def test
    it "should be #{answer.to_s} " do
      calculated_answer = Solver10
                            .new(
                              quantity_1: quantity_1,
                              quantity_2: quantity_2,
                              quantity_3: quantity_3,
                            ).solve

      calculated_answer.should eq(answer)
    end
  end
end
