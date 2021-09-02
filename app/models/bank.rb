class Bank < ApplicationRecord
  # レートを保持
  def rates
    @rates ||= {}
  end

  # 換金
  def reduce(source:, currency:)
    # sourceは MoneyかSumで、それぞれにreduce()があるので、各クラスのreduce()を呼ぶ
    source.reduce(bank: self, to: currency)
  end

  # 保持したいレートを追加
  def addRate(from:, to:, rate:)
    rates.store(Pair.new(from: from, to: to).hash_key, rate.to_i)
  end

  # レートを問い合わせる
  def rate(from: ,to:)
    return 1 if from === to # 同じ通貨同士のレートは1

    rates.dig(Pair.new(from: from, to: to).hash_key)
  end
end
