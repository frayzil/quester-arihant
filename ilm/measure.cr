require "./unit.cr"
require "./dimension.cr"

require "./float_64.cr"

class Measure
  property name
  property value
  property unit
  property string

  PLANKS_CONSTANT = new(
    name: :planks_constant,
    value: 6.62607004 * 10.0**-34,
    unit: Unit::KILOGRAM * Unit::METER**2 / Unit::SECOND
  )

  GRAVITATIONAL_CONSTANT = new(
    name: :graviational_constant,
    value: 6.67408 * 10.0**-11,
    unit: Unit::METER ** 3 / Unit::KILOGRAM / Unit::SECOND ** 2
  )

  ELECTRON_MASS = new(
    name: :electron_mass,
    value: 9.1093837015 * 10.0**-31,
    unit: Unit::KILOGRAM
  )

  ELECTRON_CHARGE = new(
    name: :electron_charge,
    value: -1.6021766208 * 10.0**-19,
    unit: Unit::COULOMB
  )

  SPEED_OF_LIGHT = new(
    name: :speed_of_light,
    value: 3.0 * 10.0**8,
    unit: Unit::METER / Unit::SECOND
  )

  PI = new(
    name: :pi,
    value: 3.14,
    unit: Unit::NIL
  )
  
  PERMEABILITY_OF_FREE_SPACE = new(
    value: PI.value * 4.0 * 10.0 ** -7,
    unit: Unit::NEWTON / Unit::AMPERE ** 2
  )

  EPSILON_NAUGHT = new(
    value: 8.854 * 10.0 **-12,
    unit: Unit::FARAD / Unit::METER 
  )

  STEFAN_CONSTANT = new(
    value: 5.67 * 10.0 ** -8,
    unit: Unit::KILOGRAM / (Unit::SECOND ** 3 * Unit::KELVIN ** 4)
  )

  WEIN_CONSTANT = new(
    value: 2.89 * 10.0 ** -3,
    unit: Unit::METER * Unit::KELVIN
  )

  def initialize(
    @value : Float64 | Measure,
    @unit : Unit,
    @name : Symbol? = nil,
  )
  end

  # def measured_in(new_unit : Unit)
  #   return self if unit == new_unit
    
  #   conversions = Unit::CONVERSIONS.select do |conversion|
  #     conversion[:from] == unit &&
  #     conversion[:to] == new_unit
  #   end
    
  #   conversion = conversions.first
    
  #   self.unit = new_unit
  #   self.value = conversion[:operation].call(value)
  #   self
  # end

  def dimension
    unit.dimension
  end

  def +(other : Measure)
    # other = other.measured_in(new_unit: unit)

    Measure.new(
      value: value + other.value,
      unit: unit
    )
  end

  def -(other : Measure)
    # other = other.measured_in(new_unit: unit)

    Measure.new(
      value: value - other.value,
      unit: unit
    )
  end


  def /(factor : Float64)
    # other = other.measured_in(new_unit: unit)

    Measure.new(
      value: value / factor,
      unit: unit
    )
  end

  def /(other : Measure)
    # other = other.measured_in(new_unit: unit)

    Measure.new(
      value: value / other.value,
      unit: unit / other.unit
    )
  end

  def *(other : Measure)
    # other = other.measured_in(new_unit: unit)

    Measure.new(
      value: value * other.value,
      unit: unit * other.unit
    )
  end
  
  def *(factor : Float64)
    Measure.new(
      value: value * factor,
      unit: unit
    )
  end

  def **(exponent : Float64)
    Measure.new(
      value: value ** exponent,
      unit: unit ** exponent
    )
  end

  def ==(other : Measure)
    value == other.measured_in(new_unit: unit).value
  end

  def to_s
    name || "#{value} #{unit}"
  end
end
