require "../../../../axis.cr"
require "../../../../point.cr"
require "../../../../angle.cr"

class Solver22
  property mu_1, mu_2, incident_vector

  def initialize(
    @mu_1 : Float64,
    @mu_2 : Float64,
    @incident_vector : Vector)
  end

  def solve
    Vector.new(
      refracted_vector_x,
      refracted_vector_y,
      refracted_vector_z
    )
  end

  private def refracted_vector_x
    coefficient = 1
    coefficient = -1 if incident_vector.x < 0
    coefficient = 0 if incident_vector.x == 0
    coefficient * angle_of_refraction.sin
  end

  private def refracted_vector_y
    coefficient = 1
    coefficient = -1 if incident_vector.y < 0
    coefficient = 0 if incident_vector.y == 0
    coefficient * angle_of_refraction.tan
  end

  private def refracted_vector_z
    coefficient = 1
    coefficient = -1 if incident_vector.z < 0
    coefficient = 0 if incident_vector.z == 0
    coefficient * angle_of_refraction.cos
  end

  private def angle_of_refraction
    angle_in_rad = Math.asin(sin_of_angle_of_refraction).abs
    Angle.new(angle_in_rad, :rad)
  end

  private def sin_of_angle_of_refraction
    angle_of_incidence.sin * mu_1 / mu_2
  end

  private def angle_of_incidence
    angle_in_rad = Math.atan(incident_vector.x / incident_vector.z).abs
    Angle.new(angle_in_rad, :rad)
  end
end
