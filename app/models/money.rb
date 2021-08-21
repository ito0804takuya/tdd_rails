class Money < ApplicationRecord
  def equals(object)
    return amount === object.amount && object.class == self.class
  end
end
