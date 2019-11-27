require "spec"
require "./solver_16.cr"

describe Solver16 do
  [
    { axis: :x, point: [2.0, 3.0, 4.0],
      answer: 5.0 },

    { axis: :x, point: [0.0, 3.0, 4.0],
      answer: 5.0 },

    { axis: :y, point: [3.0, 3.0, 4.0],
      answer: 5.0 },

    { axis: :z, point: [3.0, 4.0, 4.0],
      answer: 5.0 }

  ].each{ |setting| Scenario16.new(setting).test }
end

class Scenario16
  property setting

  def initialize(
    @setting : NamedTuple(
                 axis: Symbol,
                 point: Array(Float64),
                 answer: Float64
               )
  );end

  def test
    axis = @setting[:axis]
    point = @setting[:point]
    answer = @setting[:answer]
    
    it "should be #{answer} if axis is #{axis} and point is #{point}" do
      Solver16
        .new(axis: axis, point_ary: point)
        .solve
        .should be_close(answer, 0.01)
    end
  end
end
