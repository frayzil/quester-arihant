require "spec"
require "./solver_4.cr"

require "../../../measure.cr"
require "../../../quantity.cr"

describe Solver4 do
  settings = [
    {
      measure_1: Measure::PLANKS_CONSTANT,
      measure_2: Measure::ELECTRON_CHARGE,
      answer: Quantity::MAGNETIC_FLUX
    },

    {
      measure_1: Measure::PLANKS_CONSTANT * Measure::SPEED_OF_LIGHT,
      measure_2: Measure.new(value: 1.0, unit: Unit::METER),
      answer: Quantity::ENERGY
    },

  ]

  settings.each do |setting|
    Scenario4.new(
      measure_1: setting[:measure_1],
      measure_2: setting[:measure_2],
      answer: setting[:answer],
    ).test
  end
end

class Scenario4
  property measure_1, measure_2, answer

  def initialize(
    @measure_1 : Measure,
    @measure_2 : Measure,
    @answer : Quantity
  );end

  def test
    it "should be #{answer.to_s} "\
       "if measure_1 is #{measure_1.to_s} and "\
       "measure_2 is #{measure_2.to_s}" do
      calculated_answer = Solver4
                            .new(
                              measure_1: measure_1,
                              measure_2: measure_2,
                            ).solve

      calculated_answer.to_s.should eq(answer.dimension.to_s)
    end
  end
end