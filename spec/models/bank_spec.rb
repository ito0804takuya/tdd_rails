require 'rails_helper'

RSpec.describe Bank, type: :model do
  
  it "$5 + $5 = $10" do
    # $5
    five = Money.new_dollar(amount: 5)
    # $5 + $5
    sum = five.plus(five) # Sumオブジェクト
    # 換算する銀行オブジェクト
    bank = Bank.new
    # 為替レートを適用して換算した金額
    reduced = bank.reduce(source: sum, currency: "USD") # Sum
    # $5 + $5 = $10
    expect(Money.new_dollar(amount: 10).equals(reduced)).to be_truthy
  end

end
