# quester

## Aim
Create a software that automatically solves a question with dynamic values with a piece of code.

## Example
Consider the following questions and their answers:
Is it possible to add the following quantities: 1 kilometer and 1 mile? Yes.
Is it possible to add the following quantities: 1 kilometer and 1 kilogram? No.

The solution to these questions is fairly simple. If the dimensions of the quantities are the same, they can be added. Else, they cannot be added.

If we had to write the solution as a solver code, it would simply be: 
```ruby
quantity_1.dimension == quantity_2.dimension ? ‘Yes’ : ‘No’
```
## Input YAML
The input to the system is given as a yaml file.
```yaml
text: >
  Is it possible to add the following quantities: 1 kilometer and 1 mile?
variables:
  - quantity_1
  - quantity_2
  - "yes_or_no : String"
test_cases:
  - 
    -
      name: quantity_1
      value: Unit::KILOMETER
    -
      name: quantity_2
      value: Unit::MILE
    -
      name: yes_or_no
      value: "\"yes\""

  - 
    -
      name: quantity_1
      value: Unit::KILOMETER
    -
      name: quantity_2
      value: Unit::KILOGRAM
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
          quantity_1.dimension == quantity_2.dimension ? ‘Yes’ : ‘No’
source: >
  This question was created by Fazil Basheer.
```
