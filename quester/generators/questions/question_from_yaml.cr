require "yaml"

require "../../core/variable.cr"
require "../../core/test_case.cr"
require "../../core/solver.cr"

require "./question_generator.cr"

class QuestionFromYaml
  property variables_t : Array(Variable) = [] of Variable
  property test_cases_t : Array(TestCase) = [] of TestCase
  property solvers_t : Array(Solver) = [] of Solver

  YAML.mapping(
    variables: Array(String),
    test_cases: Array(Array(NamedTuple(name: String, value: String))),
    solvers: Array(NamedTuple(id: Int32, variable: String, condition: String, code: String))
  )

  def self.load(path)
    from_yaml(File.read(path))
  end

  def transform
    transform_variables
    transform_solvers
    transform_test_cases
  end

  private def transform_variables
    @variables_t = Variable.from_names(variables)
  end

  private def transform_solvers
    @solvers_t = Solver.from_variables_and_data(@variables_t, solvers)
  end

  private def transform_test_cases
    @test_cases_t = TestCase.from_data_and_solvers(test_cases, @solvers_t)
  end
end
