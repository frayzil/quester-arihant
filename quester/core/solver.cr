class Solver
  property variable : Variable
  property condition : String
  property code : String

  def initialize(
    @variable,
    @condition = "eq",
    @code = "#"
  )
  end

  def self.from_variables_and_data(variables, data)
    data.map do |solver_data|
      variable = variables.find { |variable| variable.name == solver_data[:variable] }

      raise "Variable not found" if variable.nil?

      new(
        variable: variable,
        condition: solver_data[:condition],
        code: solver_data[:code],
      )
    end
  end
end