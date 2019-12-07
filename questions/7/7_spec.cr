require "spec"
require "./solver_7.cr"

require "../../ilm/measure.cr"
require "../../ilm/dimension.cr"
require "../../ilm/quantity.cr"

describe Solver7 do
  settings = [
    {

      measure_1: Measure::ELECTRON_CHARGE,
      measure_2: Measure::EPSILON_NAUGHT,
      measure_3: Measure::PLANKS_CONSTANT,
      measure_4: Measure::SPEED_OF_LIGHT,
      answer: Dimension::NIL
    }
  ]

  settings.each do |setting|
    Scenario7.new(
      measure_1: setting[:measure_1],
      measure_2: setting[:measure_2],
      measure_3: setting[:measure_3],
      measure_4: setting[:measure_4],
      answer: setting[:answer],
    ).test
  end
end

class Scenario7
  property measure_1, measure_2, measure_3, measure_4, answer

  def initialize(
    @measure_1 : Measure,
    @measure_2 : Measure,
    @measure_3 : Measure,
    @measure_4 : Measure,
    @answer : Dimension
  );end

  def test
    it "should be #{answer.to_s} " do

      calculated_answer = Solver7
                            .new(
                              measure_1: measure_1,
                              measure_2: measure_2,
                              measure_3: measure_3,
                              measure_4: measure_4
                            ).solve

      calculated_answer.should eq(answer)
    end
  end
end
