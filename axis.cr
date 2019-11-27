class Axis
  property name

  X = new(:x)
  Y = new(:y)
  Z = new(:z)

  ALL = [X, Y, Z]

  def self.with(name)
    return X if name == :x
    return Y if name == :y
    return Z
  end

  private def initialize(@name : Symbol);end
end
