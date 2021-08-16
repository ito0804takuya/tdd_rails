class Dollar < ApplicationRecord
  # ゲッター、セッター
  attr_accessor :amount
  # def amount
  #   @amount
  # end

  def initialize(amount:)
    @amount = amount
  end

  def times(multiplier)
    # @amount *= multiplier
    # 毎回新しいインスタンスを返す
    return Dollar.new(amount: amount * multiplier)
  end
end
