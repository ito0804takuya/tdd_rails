class Bank < ApplicationRecord

  # 換金
  def reduce(source:, currency:)
    # sourceは MoneyかSumだが、それぞれにreduce()が定義されている
    # return source.reduce(to: currency)
    return source.reduce(bank: self, to: currency)
  end

  def addRate(from:, to:, rate:)
  end

  # def self.rate(currency: ,to:)
  def rate(currency: ,to:)
    # 換金対象がCHF かつ 変換先がUSD の場合、レート = 2
    # それ以外はレート = 1
    rate = currency === "CHF" && to === "USD" ? 2 :1;
  end

end
