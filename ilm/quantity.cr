class Quantity
  property dimension

  NIL = new

  LENGTH = new(dimension: Dimension::L)

  AREA = LENGTH * LENGTH
  VOLUME = AREA * LENGTH
  
  TIME = new(dimension: Dimension::T)
  
  FREQUENCY = NIL / TIME
  ANGULAR_VELOCITY = NIL / TIME
  ANGULAR_MOMENTUM = MOMENT_OF_INERTIA * ANGULAR_VELOCITY
  ANGULAR_ACCELERATION = ANGULAR_VELOCITY / TIME
  
  VELOCITY = LENGTH / TIME
  ACCELERATION = VELOCITY / TIME
  
  MASS = new(dimension: Dimension::M)
  
  DENSITY = MASS / VOLUME
  MOMENT_OF_INERTIA = MASS * AREA

  MOMENTUM = MASS * VELOCITY
  FORCE = MOMENTUM / TIME
  PRESSURE = FORCE / AREA

  ENERGY = PRESSURE * VOLUME

  ELECTRIC_CURRENT = new(dimension: Dimension::I)

  CHARGE = ELECTRIC_CURRENT * TIME
  VOLTAGE = ENERGY / CHARGE

  CAPACITANCE = CHARGE / VOLTAGE
  RESISTANCE = VOLTAGE / ELECTRIC_CURRENT
  SPECIFIC_RESISTANCE = RESISTANCE * AREA / LENGTH
  INDUCTANCE = VOLTAGE / (ELECTRIC_CURRENT / TIME)

  ELECTRIC_FIELD = FORCE / CHARGE
  ELECTRIC_FLUX = ELECTRIC_FIELD * AREA

  MAGNETIC_FIELD = FORCE / (CHARGE * VELOCITY)
  MAGNETIC_MOMENT = NIL * ELECTRIC_CURRENT * AREA
  MAGNETIC_FLUX = MAGNETIC_FIELD * AREA

  PERMEABILITY = FORCE * AREA / CHARGE ** 2

  STIFFNESS = FORCE / LENGTH
  STRESS = PRESSURE

  EMF = ELECTRIC_FIELD * LENGTH
  POTENTIAL_DIFFERENCE = EMF
  ELECTRIC_POTENTIAL = EMF

  HEAT = ENERGY
  WORK_DONE = ENERGY


  def initialize(@dimension : Dimension = Dimension::NIL)
  end

  def *(other : Quantity)
    self.class.new(dimension + other.dimension)
  end

  def /(other : Quantity)
    self.class.new(dimension - other.dimension)
  end

  def ==(other : Quantity)
    dimension == other.dimension
  end

  def **(exponent : Int32)
    self.class.new(dimension * exponent)
  end

  def to_s
    dimension.to_s
  end
end
