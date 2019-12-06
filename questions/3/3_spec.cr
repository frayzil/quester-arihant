require "spec"
require "./solver_3.cr"

require "../../quantity.cr"

describe Solver3 do
  settings = [
    {
      quantity_1: Quantity::INDUCTANCE,
      quantity_2: Quantity::CAPACITANCE,
      answer: Quantity::RESISTANCE ** 2
    },

    {
      quantity_1: Quantity::RESISTANCE,
      quantity_2: Quantity::CAPACITANCE,
      answer: Quantity::RESISTANCE ** 2 / Quantity::TIME
    },

  ]

  settings.each do |setting|
    Scenario3.new(
      quantity_1: setting[:quantity_1],
      quantity_2: setting[:quantity_2],
      answer: setting[:answer],
    ).test
  end
end

class Scenario3
  property quantity_1, quantity_2, answer

  def initialize(
    @quantity_1 : Quantity,
    @quantity_2 : Quantity,
    @answer : Quantity
  );end

  def test
    it "should be #{answer.to_s} "\
       "if quantity_1 is #{quantity_1.to_s} and "\
       "quantity_2 is #{quantity_2.to_s}" do
      calculated_answer = Solver3
                            .new(
                              quantity_1: quantity_1,
                              quantity_2: quantity_2,
                            ).solve

      calculated_answer.should eq(answer)
    end
  end
end
