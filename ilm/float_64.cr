struct Float64
  def *(measure : Measure)
    Measure.new(
      value: self * measure.value,
      unit: measure.unit
    )
  end

  def /(measure : Measure)
    Measure.new(
      value: self / measure.value,
      unit: measure.unit
    )
  end
end