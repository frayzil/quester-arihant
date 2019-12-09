require "spec"

require "./23_1_scenario.cr"
require "./23_1_solver.cr"

describe Solver23_1 do
  settings = [

    {
      quantity_1: Quantity::PRESSURE,
      quantity_2: Quantity::STIFFNESS,
      quantity_3: Quantity::STRESS,
      selected: "no",
      
    },
    
    {
      quantity_1: Quantity::EMF,
      quantity_2: Quantity::POTENTIAL_DIFFERENCE,
      quantity_3: Quantity::ELECTRIC_POTENTIAL,
      selected: "yes",
      
    },
    
    {
      quantity_1: Quantity::HEAT,
      quantity_2: Quantity::WORK_DONE,
      quantity_3: Quantity::ENERGY,
      selected: "yes",
      
    },
    
  ]

  settings.each do |setting|
    Scenario23_1.new(
      quantity_1: setting[:quantity_1],
      quantity_2: setting[:quantity_2],
      quantity_3: setting[:quantity_3],
      selected: setting[:selected],
      
    ).test
  end
end

