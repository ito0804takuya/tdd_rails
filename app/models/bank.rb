class Bank < ApplicationRecord

  # 換金
  def reduce(source:, currency:)
    # sourceは MoneyかSumだが、それぞれにreduce()が定義されている
    return source.reduce(to: currency)
  end

end
