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
    # 換金対象がSumインスタンスの場合、合計値を返す
    sum = augend.amount + addend.amount
    return Money.new(amount: sum, currency: to)
  end
end
