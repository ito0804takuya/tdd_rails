class Money < ApplicationRecord
  include ExpressionInterface

  # クラスメソッド
  def self.new_dollar(amount:)
    return Money.new(amount: amount, currency: "USD")
  end

  def self.new_franc(amount:)
    return Money.new(amount: amount, currency: "CHF")
  end

  # インスタンスメソッド
  def equals(object)
    return amount === object.amount && currency === object.currency
  end

  def times(multiplier)
    return Money.new(amount: amount * multiplier, currency: currency)
  end

  def plus(addObject)
    return Sum.new(augend: self, addend: addObject)
  end

  # 換金
  def reduce(bank: ,to:)
    rate = bank.rate(from: currency, to: to)
    # 例 : 2CHF → 1USD
    return Money.new(amount: amount / rate, currency: to)
  end

end
