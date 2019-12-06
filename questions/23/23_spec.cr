require "spec"
require "./23_scenario.cr"
require "./23_solver.cr"

describe Solver23 do
  settings = [
    {
      property_1: property_1_value, 
      property_2: property_2_value, 
    },
  ]

  settings.each{ |setting| Scenario23.new(setting).test }
end
