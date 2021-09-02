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

  describe '#plus' do
    it "$5 + 10CHF + $5 = $15 (レートが USD:CHF = 2:1 の場合)" do
      # テスト条件を整える
      five_dollars = Money.new_dollar(amount: 5)
      ten_francs = Money.new_franc(amount: 10)
      bank = Bank.new
      bank.addRate(from: "CHF", to: "USD", rate: 2)

      # $5 + 10CHF + $5
      sum = Sum.new(augend: five_dollars, addend: ten_francs).plus(addend: five_dollars)
      # USDに変換
      result = bank.reduce(source: sum, currency: "USD")

      # $15と等しいこと
      expect(result).to have_attributes(Money.new_dollar(amount: 15).attributes)
      expect(result.equals(Money.new_dollar(amount: 15))).to be_truthy
    end
  end

  describe "#times" do
    it "($5 + 10CHF) * 2 = $20 (レートが USD:CHF = 2:1 の場合)" do
      # テスト条件を整える
      five_dollars = Money.new_dollar(amount: 5)
      ten_francs = Money.new_franc(amount: 10)
      bank = Bank.new
      bank.addRate(from: "CHF", to: "USD", rate: 2)

      # ($5 + 10CHF) * 2
      sum = Sum.new(augend: five_dollars, addend: ten_francs).times(2)
      # USDに変換
      result = bank.reduce(source: sum, currency: "USD")

      # $20と等しいこと
      expect(result).to have_attributes(Money.new_dollar(amount: 20).attributes)
      expect(result.equals(Money.new_dollar(amount: 20))).to be_truthy
    end
  end
  
end
