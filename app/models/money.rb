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
    return amount === object.amount && object.class == self.class
  end

end
