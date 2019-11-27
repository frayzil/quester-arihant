class Angle
  @value : Float64
  @unit : Symbol

  PI_rad = 3.14
  PI_deg = 180.0
  
  def initialize(value = 0.0, unit = :deg)
    @value = value
    @unit = unit
  end

  def in_rad
    return @value if @unit == :rad
    (@value / PI_deg) * PI_rad
  end

  def in_deg
    return @value if @unit == :deg
    (@value / PI_rad) * PI_deg
  end

  def cos
    Math.cos(in_rad)
  end

  def sin
    Math.sin(in_rad)
  end

  def tan
    Math.tan(in_rad)
  end
end