class String
  # Checks if character is an Integer
  # Rescue will return false instead of crashing
  def is_int?
    Integer(self) != nil rescue false
  end
end
