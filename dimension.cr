class Dimension
  property mass, length, time, temperature, electric_current,
           luminous_intensity, amount_of_substance,
           plane_angle, solid_angle

  NIL = new

  M = new(mass: 1)
  L = new(length: 1)
  T = new(time: 1)

  K = new(temperature: 1)
  I = new(electric_current: 1)
  J = new(luminous_intensity: 1)
  N = new(amount_of_substance: 1)

  IT = I + T

  def initialize(
    @mass : Int32 | Float64 = 0,
    @length : Int32 | Float64 = 0,
    @time : Int32 | Float64 = 0,
    @temperature : Int32 | Float64 = 0,
    @electric_current : Int32 | Float64 = 0,
    @luminous_intensity : Int32 | Float64 = 0,
    @amount_of_substance : Int32 | Float64 = 0,
    @plane_angle : Int32 | Float64 = 0,
    @solid_angle : Int32 | Float64 = 0
  )
  end

  def +(other : Dimension)
    Dimension.new(
      mass: mass + other.mass,
      length: length + other.length,
      time: time + other.time,
      temperature: temperature + other.temperature,
      electric_current: electric_current + other.electric_current,
      luminous_intensity: luminous_intensity + other.luminous_intensity,
      amount_of_substance: amount_of_substance + other.amount_of_substance,
      plane_angle: plane_angle + other.plane_angle,
      solid_angle: solid_angle + other.solid_angle,
    )
  end

  def -(other : Dimension)
    Dimension.new(
      mass: mass - other.mass,
      length: length - other.length,
      time: time - other.time,
      temperature: temperature - other.temperature,
      electric_current: electric_current - other.electric_current,
      luminous_intensity: luminous_intensity - other.luminous_intensity,
      amount_of_substance: amount_of_substance - other.amount_of_substance,
      plane_angle: plane_angle - other.plane_angle,
      solid_angle: solid_angle - other.solid_angle,
    )
  end

  def ==(other : Dimension)
    mass == other.mass &&
      length == other.length &&
      time == other.time &&
      temperature == other.temperature &&
      electric_current == other.electric_current &&
      luminous_intensity == other.luminous_intensity &&
      amount_of_substance == other.amount_of_substance &&
      plane_angle == other.plane_angle &&
      solid_angle == other.solid_angle
  end

  def *(factor : Int32 | Float64)
    Dimension.new(
      mass: mass * factor,
      length: length * factor,
      time: time * factor,
      temperature: temperature * factor,
      electric_current: electric_current * factor,
      luminous_intensity: luminous_intensity * factor,
      amount_of_substance: amount_of_substance * factor,
      plane_angle: plane_angle * factor,
      solid_angle: solid_angle * factor,
    )
  end

  def to_s
    parts = [] of String
    parts << "M#{mass}" unless mass == 0
    parts << "L#{length}" unless length == 0
    parts << "T#{time}" unless time == 0
    parts << "K#{temperature}" unless temperature == 0
    parts << "#{electric_current}" unless electric_current == 0
    parts << "J#{luminous_intensity}" unless luminous_intensity == 0
    parts << "N#{amount_of_substance}" unless amount_of_substance == 0

    parts.join
  end
end