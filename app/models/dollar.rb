# class Dollar < ApplicationRecord
class Dollar < Money
  # ゲッター、セッター
  # attr_accessor :amount

  # インスタンス初期化時に実行
  # def initialize(amount:)
  #   @amount = amount
  # end

  def times(multiplier)
    # @amount *= multiplier
    # 毎回新しいインスタンスを返す
    return Dollar.new(amount: amount * multiplier)
  end

  # Value Objectパターンのため
  # def equals(object)
  #   return amount === object.amount
  # end
end
