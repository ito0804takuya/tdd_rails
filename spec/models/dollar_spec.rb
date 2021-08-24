# require 'rails_helper'

# RSpec.describe Dollar, type: :model do
  
#   # times()メソッドをテストする
#   describe '#times' do
#     # テスト（最小テスト単位）
#     it "$5 * 2 = $10" do
#       five_dollar = Money.new_dollar(amount: 5)
#       # 5*2 = 10
#       expect(Money.new_dollar(amount: 10)).to have_attributes(five_dollar.times(2).attributes)
#       # 5*3 = 15
#       expect(Money.new_dollar(amount: 15)).to have_attributes(five_dollar.times(3).attributes)
#     end
#   end

#   describe '#equals' do
#     it "$5 = $5" do
#       # 三角測量
#       # $5 = $5
#       expect(Money.new_dollar(amount: 5).equals(Money.new_dollar(amount: 5))).to be_truthy
#       # $5 = $6
#       expect(Money.new_dollar(amount: 5).equals(Money.new_dollar(amount: 6))).to be_falsey
#     end
#   end

# end
