require "spec"
require "./solver_9.cr"

require "../../../../measure.cr"
require "../../../../dimension.cr"
require "../../../../quantity.cr"

describe Solver9 do
  settings = [
    {
      quantity_1: Quantity::CAPACITANCE,
      quantity_2: Quantity::VOLTAGE,
      quantity_3: Quantity::SPECIFIC_RESISTANCE,
      measure_1: Measure::EPSILON_NAUGHT,
      answer: Dimension.new(electric_current: 1)
    },
    {
      quantity_1: Quantity::FREQUENCY,
      quantity_2: Quantity::MOMENT_OF_INERTIA,
      quantity_3: Quantity::RESISTANCE,
      measure_1: Measure::SPEED_OF_LIGHT,
      answer: Dimension.new(length: -1, time: 3, electric_current: 2)
    },
    {
      quantity_1: Quantity::ELECTRIC_FIELD,
      quantity_2: Quantity::PERMEABILITY,
      quantity_3: Quantity::MOMENTUM,
      measure_1: Measure::STEFAN_CONSTANT,
      answer: Dimension.new(length: 3, time: -3, temperature: 4, electric_current: -3)
    }
  ]

  settings.each do |setting|
    Scenario9.new(
      quantity_1: setting[:quantity_1],
      quantity_2: setting[:quantity_2],
      quantity_3: setting[:quantity_3],
      measure_1: setting[:measure_1],
      answer: setting[:answer],
    ).test
  end
end

class Scenario9
  property quantity_1, quantity_2, quantity_3, measure_1, answer

  def initialize(
    @quantity_1 : Quantity,
    @quantity_2 : Quantity,
    @quantity_3 : Quantity,
    @measure_1 : Measure,
    @answer : Dimension
  );end

  def test
    it "should be #{answer.to_s} " do
      calculated_answer = Solver9
                            .new(
                              quantity_1: quantity_1,
                              quantity_2: quantity_2,
                              quantity_3: quantity_3,
                              measure_1: measure_1
                            ).solve

      calculated_answer.to_s.should eq(answer.to_s)
    end
  end
end
