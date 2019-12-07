struct Bool
  def true?
    self == true
  end

  def false?
    !true?
  end
end