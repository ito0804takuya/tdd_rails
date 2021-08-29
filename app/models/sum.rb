# 注: ApplicationRecord継承していない
class Sum
  include ExpressionInterface

  attr_accessor :augend, :addend

  def initialize(augend:, addend:)
    @augend = augend
    @addend = addend
  end

  # 換金
  def reduce(to:)
    sum = augend.amount + addend.amount
    return Money.new(amount: sum, currency: to)
  end
end
