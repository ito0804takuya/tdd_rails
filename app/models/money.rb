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
    # 毎回新しいインスタンスを返す
    return Money.new(amount: amount * multiplier, currency: currency)
  end

  def plus(addObject)
    # return Money.new(amount: amount + addObject.amount, currency: currency)
    return Sum.new(augend: self, addend: addObject)
  end

  # 換金
  def reduce(to:)
    # 換金対象がMoneyインスタンスの場合、そのまま返す
    return self
  end

end
