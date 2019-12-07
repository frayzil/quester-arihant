require "spec"
require "./solver_22.cr"

require "../../ilm/vector.cr"

describe Solver22 do
  settings = [
    {
      mu_1: sqrt2,
      mu_2: sqrt3,
      incident_vector: Vector.new(sqrt3, 0.0, -1.0),
      answer: Vector.new(1.0, 0.0, -1.0).unit_vector
    },

    {
      mu_1: sqrt2,
      mu_2: sqrt3,
      incident_vector: Vector.new(0.0, 0.0, -1.0),
      answer: Vector.new(0.0, 0.0, -1.0).unit_vector,
    },

    {
      mu_1: sqrt2,
      mu_2: sqrt3,
      incident_vector: Vector.new(0.0, 0.0, -2.0),
      answer: Vector.new(0.0, 0.0, -1.0).unit_vector,
    },

    {
      mu_1: 1.0,
      mu_2: 1.0,
      incident_vector: Vector.new(sqrt3, 0.0, -1.0),
      answer: Vector.new(sqrt3, 0.0, -1.0).unit_vector,
    },
  ]

  settings.each{ |setting| Scenario22.new(setting).test }
end

class Scenario22
  property setting

  def initialize(
    @setting : NamedTuple(
      mu_1: Float64,
      mu_2: Float64,
      incident_vector: Vector,
      answer: Vector
    )
  );end

  def test
    mu_1 = @setting[:mu_1]
    mu_2 = @setting[:mu_2]
    incident_vector = @setting[:incident_vector]
    answer = @setting[:answer]
    
    it "should be #{answer.to_s} "\
       "if mu_1 is #{mu_1}, mu_2 is #{mu_2} and "\
       "incident_vector is #{incident_vector.to_s}" do
      calculated_answer = Solver22
                            .new(mu_1: mu_1, mu_2: mu_2, incident_vector: incident_vector)
                            .solve

      calculated_answer.x.should be_close(answer.x, 0.01)
      calculated_answer.y.should be_close(answer.y, 0.01)
      calculated_answer.z.should be_close(answer.z, 0.01)
    end
  end
end

def sqrt2
  Math.sqrt(2)
end

def sqrt3
  Math.sqrt(3)
end