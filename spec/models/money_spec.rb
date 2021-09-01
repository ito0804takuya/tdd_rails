require 'rails_helper'

RSpec.describe Money, type: :model do

  it "通貨の単位 dollarはUSDで,francはCHFか" do
    expect(Money.new_dollar(amount: 1).currency).to eq "USD"
    expect(Money.new_franc(amount: 1).currency).to eq "CHF"
  end

  it "$5 != 5CHF" do
    expect(Money.new_franc(amount: 5).equals(Money.new_dollar(amount: 5))).to be_falsey
  end

  # times()メソッドをテストする
  describe '#times' do
    it "$5 * 2 = $10" do
      five_dollar = Money.new_dollar(amount: 5)
      # 5*2 = 10
      expect(Money.new_dollar(amount: 10)).to have_attributes(five_dollar.times(2).attributes)
      # 5*3 = 15
      expect(Money.new_dollar(amount: 15)).to have_attributes(five_dollar.times(3).attributes)
    end
  end

  describe '#equals' do
    it "$5 = $5" do
      # 三角測量
      # $5 = $5
      expect(Money.new_dollar(amount: 5).equals(Money.new_dollar(amount: 5))).to be_truthy
      # $5 = $6
      expect(Money.new_dollar(amount: 5).equals(Money.new_dollar(amount: 6))).to be_falsey
    end
  end

  describe "#reduce" do
    it "2CHF = 1$" do
      bank = Bank.new
      # レートを設定
      bank.addRate(from: "CHF", to: "USD", rate: 2)
      # 換金( 2CHF → ?USD )
      result = bank.reduce(source: Money.new_franc(amount: 2), currency: "USD")
      # 2CHF = 1$
      expect(result).to have_attributes(Money.new_dollar(amount: 1).attributes)
      expect(result.equals(Money.new_dollar(amount: 1))).to be_truthy
    end
  end

  it "$5 + 10CHF = $10 (レートが USD:CHF = 2:1 の場合)" do
    # テスト条件を整える
    five_dollars = Money.new_dollar(amount: 5)
    ten_francs = Money.new_franc(amount: 10)
    bank = Bank.new
    bank.addRate(from: "CHF", to: "USD", rate: 2)

    # $5 + 10CHF し、USDに変換
    result = bank.reduce(source: five_dollars.plus(ten_francs), currency: "USD")

    # $10と等しいこと
    expect(result).to have_attributes(Money.new_dollar(amount: 10).attributes)
    expect(result.equals(Money.new_dollar(amount: 10))).to be_truthy
  end
  
end
