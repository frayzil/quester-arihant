class VariableValue
  property name : String
  property value : String

  def initialize(@name, @value)
  end

  def self.from_data(data : NamedTuple(name: String, value: String))
    new(
      name: data[:name],
      value: data[:value]
    )
  end

  def self.from_data(data : Array(NamedTuple(name: String, value: String)))
    data.map { |datum| from_data(datum) }
  end
end
