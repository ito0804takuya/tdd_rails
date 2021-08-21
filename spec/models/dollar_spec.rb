require 'rails_helper'

RSpec.describe Dollar, type: :model do
  
  # times()メソッドをテストする
  describe '#times' do
    # テスト（最小テスト単位）
    it "$5 * 2 = $10" do
      # 5ドル
      five_dollar = Dollar.new(amount: 5)
      # 5*2 = 10
      expect(Dollar.new(amount: 10)).to have_attributes(five_dollar.times(2).attributes)
      # 5*3 = 15
      expect(Dollar.new(amount: 15)).to have_attributes(five_dollar.times(3).attributes)
    end

    it "$5 = $5" do
      # 三角測量
      expect(Dollar.new(amount: 5).equals(Dollar.new(amount: 5))).to be_truthy
      expect(Dollar.new(amount: 5).equals(Dollar.new(amount: 6))).to be_falsey
    end
  end

end
