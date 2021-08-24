require 'rails_helper'

RSpec.describe Franc, type: :model do

  describe '#times' do
    it "5CHF * 2 = 10CHF" do
      five_franc = Money.new_franc(amount: 5)
      expect(Money.new_franc(amount: 10)).to have_attributes(five_franc.times(2).attributes)
      expect(Money.new_franc(amount: 15)).to have_attributes(five_franc.times(3).attributes)
    end
  end

  describe '#equals' do
    it "5CHF = 5CHF" do
      expect(Money.new_franc(amount: 5).equals(Money.new_franc(amount: 5))).to be_truthy
      expect(Money.new_franc(amount: 5).equals(Money.new_franc(amount: 6))).to be_falsey
    end
  end

end
