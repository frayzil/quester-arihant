require "ecr"

require "../../core/test_case.cr"

class SpecGenerator
  def initialize(
    @number : Int32,
    @test_cases : Array(TestCase),
    @solvers : Array(Solver),
  )
    puts "#{self.class.name}#initialize"
  end

  ECR.def_to_s("quester/generators/specs/sample_spec.cr.ecr")
end
