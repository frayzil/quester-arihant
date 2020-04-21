# quester

## Aim
Create a software that automatically solves a question with dynamic values with a piece of code.

## Example
Consider the following questions and their answers:
Is it possible to add the following units: 1 kilometer and 1 mile? Yes.
Is it possible to add the following units: 1 kilometer and 1 kilogram? No.

The solution to these questions is fairly simple. If the dimensions of the units are the same, they can be added. Else, they cannot be added.

If we had to write the solution as a solver code, it would simply be: 
```crystal
unit_1.dimension == unit_2.dimension ? ‘Yes’ : ‘No’
```
## Input YAML
The input to the system is given as a yaml file.
```yaml
text: >
  Is it possible to add the following units: 1 kilometer and 1 mile?
variables:
  - unit_1
  - unit_2
  - "yes_or_no : String"
test_cases:
  - 
    -
      name: unit_1
      value: Kilometer
    -
      name: unit_2
      value: Mile
    -
      name: yes_or_no
      value: "\"yes\""

  - 
    -
      name: unit_1
      value: Kilometer
    -
      name: unit_2
      value: Kilogram
    -
      name: yes_or_no
      value: "\"no\""

solvers:
  - 
    id: 1
    variable: yes_or_no
    condition: eq
    code: >
      #
          unit_1.dimension == unit_2.dimension ? ‘Yes’ : ‘No’
source: >
  This question was created by Fazil Basheer for demo purpose.
```

## Output Crystal Code
The application will generate the following files based on the above YAML.

### Scenario File
```crystal
require "../../ilm/**"

class Scenario
  property unit_1 : Unit
  property unit_2 : Unit
  property yes_or_no : String
  
  def initialize(
    @unit_1,
    @unit_2,
    @yes_or_no,
    
  );end

  def test
    it "should pass" do
      solver = Solver.new(
        unit_1: unit_1,
        unit_2: unit_2,
        
      )

      answer = solver.solve

      answer.should eq(yes_or_no)
    end
  end
end
```

### Solver File
```crystal
class Solver
  property unit_1 : Unit
  property unit_2 : Unit
  
  def initialize(
    @unit_1,
    @unit_2,
        
  );end

  def solve
    #
    unit_1.dimension == unit_2.dimension ? ‘Yes’ : ‘No’

  end
end
```

### Spec File
```crystal
require "spec"

require "./scenario.cr"
require "./solver.cr"

describe Solver do
  settings = [

    {
      unit_1: Unit::KILOMETER,
      unit_2: Unit::MILE,
      yes_or_no: "yes",
      
    },
    
    {
      unit_1: Unit::KILOMETER,
      unit_2: Unit::KILOGRAM,
      yes_or_no: "no",
      
    },
    
  ]

  settings.each do |setting|
    Scenario.new(
      unit_1: setting[:unit_1],
      unit_2: setting[:unit_2],
      yes_or_no: setting[:yes_or_no],
      
    ).test
  end
end

```

## Ilm
Ilm is a crystal library that encapsulates the concepts of science.
To make the above question work, we must add the unit 'Mile' to Ilm.

inside the class definition of `Unit`, add `MILE = new(symbol: 'm', dimension: Dimension::L)`
