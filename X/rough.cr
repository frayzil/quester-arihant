require "spec"

require "../measure.cr"

describe SolverS do
  it "should add correctly" do
    (
      Measure.new(value: 1.0, unit: Unit::KILOGRAM) +
      Measure.new(value: 1.0, unit: Unit::GRAM)
    ).should eq Measure.new(value: 1.001, unit: Unit::KILOGRAM)
  end
end

class SolverX

end