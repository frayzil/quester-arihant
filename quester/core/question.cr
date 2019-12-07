class Question
  property variables : Array(Variable)
  property test_cases : Array(TestCase)
  property solvers : Array(Solver)
  
  def initialize(
    @variables,
    @test_cases,
    @solvers,
  )
  end
end