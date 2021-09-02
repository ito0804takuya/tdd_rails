class Money < ApplicationRecord
  include ExpressionInterface

  # クラスメソッド
  # USD(ドル)を生成
  def self.new_dollar(amount:)
    Money.new(amount: amount, currency: "USD")
  end

  # CHF(フラン)を生成
  def self.new_franc(amount:)
    Money.new(amount: amount, currency: "CHF")
  end

  # インスタンスメソッド
  def equals(object)
    amount === object.amount && currency === object.currency
  end

  def times(multiplier)
    Money.new(amount: amount * multiplier, currency: currency)
  end

  def plus(addObject)
    Sum.new(augend: self, addend: addObject)
  end

  # 換金
  def reduce(bank: ,to:)
    rate = bank.rate(from: currency, to: to)
    # 例 : 2CHF → 1USD
    Money.new(amount: amount / rate, currency: to)
  end
end
