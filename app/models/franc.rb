class Franc < Money
  CURRENCY = "CHF"

  def times(multiplier)
    # return Franc.new(amount: amount * multiplier)
    return Money.new_franc(amount: amount * multiplier)
  end

end
