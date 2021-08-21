class Dollar < Money

  def times(multiplier)
    # 毎回新しいインスタンスを返す
    return Dollar.new(amount: amount * multiplier)
  end

end
