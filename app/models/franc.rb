class Franc < Money

  def times(multiplier)
    return Money.new_franc(amount: amount * multiplier)
  end

end
