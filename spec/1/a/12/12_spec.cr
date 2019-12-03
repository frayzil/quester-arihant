require "spec"
require "./solver_12.cr"

require "../../../../measure.cr"
require "../../../../dimension.cr"
require "../../../../quantity.cr"

describe Solver12 do
  settings = [
    {
      measure_1: Measure::PLANKS_CONSTANT,
      measure_2: Measure::SPEED_OF_LIGHT,
      answer: Dimension.from_s("M1L3T-2")
    },
    {
      measure_1: Measure::GRAVITATIONAL_CONSTANT,
      measure_2: Measure::ELECTRON_MASS,
      answer: Dimension.from_s("L3T-2")
    }
  ]

  settings.each do |setting|
    Scenario12.new(
      measure_1: setting[:measure_1],
      measure_2: setting[:measure_2],
      answer: setting[:answer],
    ).test
  end
end

class Scenario12
  property measure_1, measure_2, answer

  def initialize(
    @measure_1 : Measure,
    @measure_2 : Measure,
    @answer : Dimension
  );end

  def test
    it "should be #{answer.to_s} " do
      calculated_answer = Solver12
                            .new(
                              measure_1: measure_1,
                              measure_2: measure_2
                            ).solve

      calculated_answer.should eq(answer)
    end
  end
end
