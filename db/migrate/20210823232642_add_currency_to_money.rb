class AddCurrencyToMoney < ActiveRecord::Migration[6.0]
  def change
    add_column :money, :currency, :string
  end
end
