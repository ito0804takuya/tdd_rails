require 'rails_helper'

RSpec.describe Money, type: :model do

  it "通貨の確認 dollarはUSDで,francはCHFか" do
    expect(Money.new_dollar(amount: 1).currency).to eq "USD"
    expect(Money.new_franc(amount: 1).currency).to eq "CHF"
  end

  it "$5 != 5CHF" do
    expect(Money.new_franc(amount: 5).equals(Money.new_dollar(amount: 5))).to be_falsey
  end

  it "$5 + $5 = $10" do
    sum = Money.new_dollar(amount: 5).plus(Money.new_dollar(amount: 5))
    # expect(sum).to eq Money.new_dollar(amount: 10)
    expect(sum.equals(Money.new_dollar(amount: 10))).to be_truthy
    expect(sum).to have_attributes(Money.new_dollar(amount: 10).attributes)

    # $5
    five = Money.new_dollar(amount: 5)
    # $5 + $5
    sum = five.plus(five)
    # 換算する銀行オブジェクト
    bank = Bank.new
    # 為替レートを適用して換算した金額
    reduced = bank.reduce(money: sum, currency: "USD")
    expect(reduced.equals(Money.new_dollar(amount: 10))).to be_truthy
    expect(reduced).to have_attributes(Money.new_dollar(amount: 10).attributes)
  end

  # times()メソッドをテストする
  describe '#times' do
    # テスト（最小テスト単位）
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
end
