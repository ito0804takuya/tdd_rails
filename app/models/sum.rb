# 注: ApplicationRecord継承していない
class Sum
  include ExpressionInterface

  attr_accessor :augend, :addend

  def initialize(augend:, addend:)
    @augend = augend
    @addend = addend
  end

  # 換金
  def reduce(bank: ,to:)
    # 被加算数と加数を to通貨単位に変換し、合計する
    sum = augend.reduce(bank: bank, to: to).amount + addend.reduce(bank: bank, to: to).amount
    return Money.new(amount: sum, currency: to)
  end

  def plus(addend:)
    Sum.new(augend: self, addend: addend)
  end
end
