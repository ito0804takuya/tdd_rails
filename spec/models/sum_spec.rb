require 'rails_helper'

RSpec.describe Sum, type: :model do
  
  describe '#plus' do
    it "plus()の出力のSumオブジェクトには、被加算数と加数が正しくセットされているか" do
      # $5
      five = Money.new_dollar(amount: 5) # Moneyオブジェクト
      # $5 + $5
      sum = five.plus(five) # Sumオブジェクト

      # 被加算数 = $5
      expect(sum.augend).to have_attributes(five.attributes)
      # 加数 = $5
      expect(sum.addend).to have_attributes(five.attributes)
    end
  end

  describe '#reduce' do
    it "$3+$4を換金した結果、$7と等しくなるか" do
      # $3 + $4
      sum = Sum.new(augend: Money.new_dollar(amount: 3), addend: Money.new_dollar(amount: 4))
      bank = Bank.new
      # BankがSum($7)をUSDで換金
      result = bank.reduce(sum: sum, currency: "USD")
      # 換金結果 = $7
      expect(result).to have_attributes(Money.new_dollar(amount: 7).attributes)
    end
  end
end
