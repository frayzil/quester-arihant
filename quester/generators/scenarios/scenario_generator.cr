require "ecr"

require "../../core/variable.cr"
require "../../core/solver.cr"

class ScenarioGenerator

  @number : Int32
  @variables : Array(Variable)
  @solver : Solver

  @answer_variable : Variable
  @known_variables : Array(Variable)

  def initialize(
    @number,
    @variables,
    @solver
  )
    puts "#{self.class.name}#initialize"
    
    answer_variable = @variables.find { |variable| variable.name == @solver.variable.name }

    raise "Answer variable not found" if answer_variable.nil?

    @answer_variable = answer_variable
    @known_variables = @variables - [@answer_variable]
  end

  ECR.def_to_s("quester/generators/scenarios/sample_scenario.cr.ecr")
end
