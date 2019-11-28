require "spec"
require "./solver_8.cr"

require "../../../../measure.cr"
require "../../../../dimension.cr"
require "../../../../quantity.cr"

describe Solver8 do
  settings = [
    {

      measure_1: Measure::STEFAN_CONSTANT,
      measure_2: Measure::WEIN_CONSTANT,
      answer: Dimension.new(mass: 1, length: 4, time: -3)
    }
  ]

  settings.each do |setting|
    Scenario8.new(
      measure_1: setting[:measure_1],
      measure_2: setting[:measure_2],
      answer: setting[:answer],
    ).test
  end
end

class Scenario8
  property measure_1, measure_2, answer

  def initialize(
    @measure_1 : Measure,
    @measure_2 : Measure,
    @answer : Dimension
  );end

  def test
    it "should be #{answer.to_s} " do
      calculated_answer = Solver8
                            .new(
                              measure_1: measure_1,
                              measure_2: measure_2
                            ).solve

      calculated_answer.to_s.should eq(answer.to_s)
    end
  end
end
