class ScenarioFileCreator
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
    scenario_file_name = "#{@prefix}_scenario.cr"
    File.new(scenario_file_name, "w+")
    File.write(
      scenario_file_name,
      ScenarioGenerator.new(
        number: @number,
        variables: @variables,
        solver: @solver
      ).to_s
    )
  end
end