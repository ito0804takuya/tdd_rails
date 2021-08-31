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
    it "SUM($3+$4)を換金した結果、$7と等しくなるか" do
      # $3 + $4
      sum = Sum.new(augend: Money.new_dollar(amount: 3), addend: Money.new_dollar(amount: 4))
      bank = Bank.new
      # BankがSum($7)をUSDで換金
      result = bank.reduce(source: sum, currency: "USD")
      # 換金結果 = $7
      expect(result).to have_attributes(Money.new_dollar(amount: 7).attributes)
    end

    it "同じ通貨同士のレートは1になるか" do
      expect(Bank.new.rate(from: "USD", to: "USD")).to eq 1
    end

    it "Money($1)を換金し、$1と等しくなるか" do
      bank = Bank.new
      # BankがMoney($1)をUSDで換金
      result = bank.reduce(source: Money.new_dollar(amount: 1), currency: "USD")
      expect(result).to have_attributes(Money.new_dollar(amount: 1).attributes)
    end
  end
end
