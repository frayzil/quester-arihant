require "yaml"

module Unit
  class Prefix
    property name, symbol, decimal_exponent, english_name

    DATA = YAML.parse File.read("./prefixes.yml")

    def self.for(@symbol : String)
      new(DATA[symbol.to_s])
    end

    def initialize(data  : Hash)
      @name = data["name"]
      @decimal_exponent = data["decimal_exponent"]
      @english_name = data["english_name"]
    end
  end
end