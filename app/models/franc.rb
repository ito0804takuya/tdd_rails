class Franc < Money

  def times(multiplier)
    return Franc.new(amount: amount * multiplier)
  end

end
