# 注: ApplicationRecord継承していない
# レートの組み合わせ
class Pair
  attr_accessor :from, :to

  def initialize(from:, to:)
    @from = from
    @to = to
  end

  def equals(object)
    return from === object.from && to === object.to
  end
  
  def hashCode()
    return 0
  end

  # Bankのレートを保持するハッシュのキー
  def hash_key
    "#{from}-#{to}"
  end
end
