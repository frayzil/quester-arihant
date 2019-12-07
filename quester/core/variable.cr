class Variable
  property name : String
  property type : String

  def initialize(@name)
    @type = explicit_type || implicit_type
    @name = @name.split(" : ")[0]
  end

  def self.from_names(names)
    names.map { |name| from_name name }
  end

  def self.from_name(name)
    new(
      name: name
    )
  end

  private def explicit_type
    splits = @name.split(" : ")
    splits[1] if splits.size == 2
  end

  private def implicit_type
    @name.gsub(/_[0-9]+$/, "").camelcase
  end
end
