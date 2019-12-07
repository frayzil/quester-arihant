require "./variable_value.cr"
require "./solver.cr"

class TestCase
  property variable_values : Array(VariableValue)
  property solvers : Array(Solver)

  def initialize(
    @variable_values = [] of VariableValue,
    @solvers = [] of Solver
  )
  end

  def self.from_data_and_solvers(data, solvers)
    data.map do |variable_values_data|

      variable_values_t = VariableValue.from_data(variable_values_data)

      new(
        variable_values: variable_values_t,
        solvers: solvers
      )
    end
  end

  def answer_for(solver)
    value_for(solver.variable.name)
  end

  def value_for(variable_name)
    variable_value_for(variable_name).value
  end

  def variable_value_for(variable_name)
    variable_value = @variable_values.find { |vv| vv.name == variable_name }

    raise "VariableValue not found" if variable_value.nil?

    variable_value
  end
end