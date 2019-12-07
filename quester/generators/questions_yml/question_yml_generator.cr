class QuestionYmlGenerator
  @number : Int32 = 1
  @folder : Dir

  def initialize(@number = 1)
    puts "#{self.class.name}#initialize"
    @questions_dir = Dir.new("questions")
    @number = get_number
    @folder = make_new_folder
  end

  def generate
    puts "#{self.class.name}#generate"
    make_yml_file
  end

  private def get_number
    puts "#{self.class.name}#get_number"
    [
      @questions_dir.children.map(&.to_i).max + 1,
      @number,
    ].max
  end

  private def make_yml_file
    puts "#{self.class.name}#make_yml_file"
    yml_file_name = "#{@folder.path}/question.yml"
    File.new(yml_file_name, "w+")
    File.write(
      yml_file_name,
      File.read("quester/generators/questions_yml/sample_question.yml")
    )
  end

  private def make_new_folder
    puts "#{self.class.name}#make_new_folder"
    Dir.mkdir("questions/#{@number}")
    Dir.new("questions/#{@number}")
  end
end
