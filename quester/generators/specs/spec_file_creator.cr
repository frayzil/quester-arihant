class SpecFileCreator
  def initialize(
    @prefix : String,
    @number : Int32,
    @test_cases : Array(TestCase),
    @solvers : Array(Solver),
  )
    puts "#{self.class.name}#initialize"
  end

  def create
    puts "#{self.class.name}#create"
    spec_file_name = "#{@prefix}_spec.cr"
    File.new(spec_file_name, "w+")
    File.write(
      spec_file_name,
      SpecGenerator.new(
        number: @number,
        test_cases: @test_cases,
        solvers: @solvers
      ).to_s
    )
  end
end
