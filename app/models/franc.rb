# class Franc < ApplicationRecord
class Franc < Money
  def times(multiplier)
    return Franc.new(amount: amount * multiplier)
  end

  # Value Objectパターンのため
  # def equals(object)
  #   return amount === object.amount
  # end
end
