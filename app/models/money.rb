class Money < ApplicationRecord

  # クラスメソッド
  def self.new_dollar(amount:)
    return Dollar.new(amount: amount)
  end

  def self.new_franc(amount:)
    return Franc.new(amount: amount)
  end

  # インスタンスメソッド
  def equals(object)
    return amount === object.amount && object.class == self.class
  end

  def currency()
    return self.class::CURRENCY
  end

end
