require "../../ilm/bool.cr"

class VariableValue
  property name : String
  property value : String

  SPECIAL_VARIABLE_PREFIXES = [
    "quantity_",
    "measure_",
    "unit_",
    "dimension_",
  ]

  def initialize(@name, @value)
    if special_prefixed?
      @value = "#{@name.split('_').first.camelcase}::"\
               "#{@value.gsub(' ', '_').upcase}"
    end
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

  private def special_prefixed?
    SPECIAL_VARIABLE_PREFIXES.map do |prefix|
      name.starts_with?(prefix)
    end.any?(&.true?)
  end
end
