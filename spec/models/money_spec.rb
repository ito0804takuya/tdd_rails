require 'rails_helper'

RSpec.describe Money, type: :model do

  it "$5 != 5CHF" do
    expect(Franc.new(amount: 5).equals(Dollar.new(amount: 5))).to be_falsey
  end
  
end
