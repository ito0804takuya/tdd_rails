require 'rails_helper'

RSpec.describe Franc, type: :model do

  it "5CHF * 2 = 10CHF" do
    five_franc = Franc.new(amount: 5)
    expect(Franc.new(amount: 10)).to have_attributes(five_franc.times(2).attributes)
    expect(Franc.new(amount: 15)).to have_attributes(five_franc.times(3).attributes)
  end

  it "5CHF = 5CHF" do
    # 三角測量
    expect(Franc.new(amount: 5).equals(Franc.new(amount: 5))).to be_truthy
    expect(Franc.new(amount: 5).equals(Franc.new(amount: 6))).to be_falsey
  end

end
