module Measures
  PLANKS_CONSTANT = Measure.new(
    name: :planks_constant,
    value: 6.62607004 * 10.0**-34,
    unit: Unit::KILOGRAM * Unit::METER**2 / Unit::SECOND
  )

  GRAVITATIONAL_CONSTANT = Measure.new(
    name: :graviational_constant,
    value: 6.67408 * 10.0**-11,
    unit: Unit::METER ** 3 / Unit::KILOGRAM / Unit::SECOND ** 2
  )

  ELECTRON_MASS = Measure.new(
    name: :electron_mass,
    value: 9.1093837015 * 10.0**-31,
    unit: Unit::KILOGRAM
  )

  ELECTRON_CHARGE = Measure.new(
    name: :electron_charge,
    value: -1.6021766208 * 10.0**-19,
    unit: Unit::COULOMB
  )

  SPEED_OF_LIGHT = Measure.new(
    name: :speed_of_light,
    value: 3.0 * 10.0**8,
    unit: Unit::METER / Unit::SECOND
  )

  PI = Measure.new(
    name: :pi,
    value: 3.14,
    unit: Unit::NIL
  )
  
  PERMEABILITY_OF_FREE_SPACE = Measure.new(
    value: PI.value * 4.0 * 10.0 ** -7,
    unit: Unit::NEWTON / Unit::AMPERE ** 2
  )

  EPSILON_NAUGHT = Measure.new(
    value: 8.854 * 10.0 **-12,
    unit: Unit::FARAD / Unit::METER 
  )

  STEFAN_CONSTANT = Measure.new(
    value: 5.67 * 10.0 ** -8,
    unit: Unit::KILOGRAM / (Unit::SECOND ** 3 * Unit::KELVIN ** 4)
  )

  WEIN_CONSTANT = Measure.new(
    value: 2.89 * 10.0 ** -3,
    unit: Unit::METER * Unit::KELVIN
  )  
end