class SolverFileCreator
  def initialize(
    @prefix : String,
    @number : Int32,
    @variables : Array(Variable),
    @solver : Solver
  )
    puts "#{self.class.name}#initialize"
  end

  def create
    puts "#{self.class.name}#create"
    solver_file_name = "#{@prefix}_#{@solver.id}_solver.cr"
    File.new(solver_file_name, "w+")
    File.write(
      solver_file_name,
      SolverGenerator.new(
        number: @number,
        variables: @variables,
        solver: @solver
      ).to_s
    )
  end
end
