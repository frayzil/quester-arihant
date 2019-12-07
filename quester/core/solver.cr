class Solver
  property id : Int32
  property variable : Variable
  property condition : String
  property code : String

  def initialize(
    @id,
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
        id: solver_data[:id],
        variable: variable,
        condition: solver_data[:condition],
        code: solver_data[:code],
      )
    end
  end
end