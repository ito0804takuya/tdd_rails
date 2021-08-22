class Dollar < Money
  CURRENCY = "USD"

  def times(multiplier)
    # 毎回新しいインスタンスを返す
    # return Dollar.new(amount: amount * multiplier)
    return Money.new_dollar(amount: amount * multiplier)
  end

end
