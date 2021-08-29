class Bank < ApplicationRecord

  # 換金
  def reduce(sum:, currency:)
    return sum.reduce(to: currency) # Sum.reduce()を呼ぶ
  end

end
