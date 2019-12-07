require "spec"
require "./solver_14.cr"

describe Solver14 do
  [
    { angle: 30.0, vector: [0.0, 0.0, -10.0],
      answer: 5 * sqrt3 },

    { angle: 60.0, vector: [0.0, 0.0, -10.0],
      answer: 5 },

    { angle: 60.0, vector: [0.0, -10.0, 0.0],
      answer: 5 * sqrt3 },
  
    { angle: 60.0, vector: [-10.0, 0.0, 0.0],
      answer: 0 },
  
    { angle: 60.0, vector: [-10.0, -10.0, -10.0],
      answer: 5 * (1 + sqrt3) },
  
    { angle: 45.0, vector: [-10.0, -10.0, -10.0],
      answer: 10 * sqrt2 },

    { angle: 90.0, vector: [0.0, -10.0, 0.0],
      answer: 10 },

    { angle: 90.0, vector: [0.0, 10.0, 0.0],
      answer: 10 }

  ].each{ |scenario| it_should_solve_correctly_for(scenario) }
end

def it_should_solve_correctly_for(scenario)
  angle = scenario[:angle]
  vector = scenario[:vector]
  answer = scenario[:answer]

  it "should be #{answer} if angle is #{angle} and vector is #{vector}" do
    Solver14
      .new(angle_deg: angle, vector_ary: vector)
      .solve
      .should be_close(answer, 0.01)
  end
end

def sqrt2
  Math.sqrt(2)
end

def sqrt3
  Math.sqrt(3)
end
