class Unit
  property dimension, prefix, base_unit
  
  NIL = new(symbol: "", dimension: Dimension::NIL)
  
  KILOGRAM = new(symbol: "kg", dimension: Dimension::M)
  METER = new(symbol: "m", dimension: Dimension::L)
  SECOND = new(symbol: "s", dimension: Dimension::T)
  AMPERE = new(symbol: "A", dimension: Dimension::I)

  GRAM = new(symbol: "g", dimension: Dimension::M)
  COULOMB = new(symbol: "C", dimension: Dimension::IT)

  NEWTON = new(symbol: "N", dimension: Dimension.new(
    mass: 1,
    length: 1,
    time: -2
  ))

  JOULE = NEWTON * METER
  VOLT = JOULE / COULOMB
  FARAD = COULOMB / VOLT

  CONVERSIONS = [
    {
      from: KILOGRAM,
      to: GRAM,
      operation: ->(value : Float64){ value * 1000.0 }
    },
  
    {
      from: GRAM,
      to: KILOGRAM,
      operation: ->(value : Float64){ value / 1000.0 }
    }
  ]

  def initialize(
    @dimension : Dimension,
    @symbol : String? = nil
  )
    # prefix_symbols = Unit::Prefix::DATA.keys.join("|")
    # base_unit_symbols = "g|m|s|A"
    # match = symbol.match(
    #   /(#{prefix_symbols})(?<prefix>)(#{base_unit_symbols})(<base_unit>)/
    # ).not_nil!

    # @prefix = Unit::Prefix.for(match.captures[0])
  end

  def **(exponent : Int32 | Float64)
    Unit.new(dimension: dimension * exponent)
  end

  def *(other : Unit)
    Unit.new(dimension: dimension + other.dimension)
  end

  def /(other : Unit)
    Unit.new(dimension: dimension - other.dimension)
  end

  def to_s
    symbol
  end

  def symbol
    @symbol || "Unit with dimension: #{dimension.to_s}"
  end

  def ==(other : Unit)
    symbol == other.symbol
  end
end
