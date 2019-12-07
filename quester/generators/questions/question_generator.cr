require "ecr"

require "../specs/spec_generator.cr"
require "../scenarios/scenario_generator.cr"
require "../scenarios/scenario_file_creator.cr"
require "../solvers/solver_file_creator.cr"
require "../specs/spec_file_creator.cr"
require "../solvers/solver_generator.cr"

require "../../core/test_case.cr"
require "../../core/variable.cr"
require "../../core/variable_value.cr"

class QuestionGenerator

  @number : Int32
  @variables : Array(Variable) = [] of Variable
  @test_cases: Array(TestCase) = [] of TestCase
  @solvers : Array(Solver) = [] of Solver

  def initialize(@number, @variables, @test_cases, @solvers)
    puts "#{self.class.name}#initialize"
    @folder = Dir.new("questions/#{@number}")
    @prefix = "#{@folder.path}/#{@number}"
  end
  
  def generate
    puts "#{self.class.name}#generate"
    make_txt_file
    make_spec_file
  
    @solvers.each do |solver|
      make_scenario_file(solver)
      make_solver_file(solver)
    end
  end

  private def make_txt_file
    puts "#{self.class.name}#make_txt_file"
    File.new("#{@folder.path}/question.txt", "w+")
  end

  private def make_spec_file
    puts "#{self.class.name}#make_spec_file"
    SpecFileCreator.new(@prefix, @number, @test_cases, @solvers).create
  end

  def make_scenario_file(solver)
    puts "#{self.class.name}#make_scenario_file"
    ScenarioFileCreator.new(@prefix, @number, @variables, solver).create
  end

  private def make_solver_file(solver)
    puts "#{self.class.name}#make_solver_file"
    SolverFileCreator.new(@prefix, @number, @variables, solver).create
  end
end
