class Variable
  property name : String
  property type : String

  def initialize(@name, @type)
  end

  def self.from_names(names)
    names.map { |name| from_name name }
  end

  def self.from_name(name)
    new(
      name: name,
      type: type_from_name(name)
    )
  end

  private def self.type_from_name(name)
    name.gsub(/_[0-9]+$/, "").camelcase
  end
end
