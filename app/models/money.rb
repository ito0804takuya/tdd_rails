class Money < ApplicationRecord

  # クラスメソッド
  def self.new_dollar(amount:)
    return Dollar.new(amount: amount, currency: "USD")
  end

  def self.new_franc(amount:)
    return Franc.new(amount: amount, currency: "CHF")
  end

  # インスタンスメソッド
  def equals(object)
    return amount === object.amount && currency === object.currency
  end

  def times(multiplier)
    # 毎回新しいインスタンスを返す
    return Money.new(amount: amount * multiplier, currency: currency)
  end

end
