class AddAmountToDollars < ActiveRecord::Migration[6.0]
  def change
    add_column :dollars, :amount, :integer
  end
end
