# require "./generators/questions_yml/question_yml_generator.cr"

# QuestionYmlGenerator.new.generate

require "./generators/questions/question_from_yaml.cr"

question = QuestionFromYaml.load("./questions/23/question.yml")
question.transform

QuestionGenerator.new(
  number: 23,
  variables: question.variables_t,
  test_cases: question.test_cases_t,
  solvers: question.solvers_t
).generate
