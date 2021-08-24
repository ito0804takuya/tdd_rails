require 'rails_helper'

RSpec.describe Money, type: :model do

  it "$5 != 5CHF" do
    expect(Money.new_franc(amount: 5).equals(Money.new_dollar(amount: 5))).to be_falsey
  end

  it "通貨を返すメソッド currency()" do
    expect(Money.new_dollar(amount: 1).currency()).to eq "USD"
    expect(Money.new_franc(amount: 1).currency()).to eq "CHF"
  end

  it "Money(10, USD)とDollar(10, USD)は等しい" do
    expect(Money.new_dollar(amount: 10).equals(Dollar.new(amount: 10, currency: "USD"))).to be_truthy
  end

end
