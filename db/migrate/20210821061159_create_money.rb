class CreateMoney < ActiveRecord::Migration[6.0]
  def change
    create_table :money do |t|
      t.integer :amount
      t.timestamps
    end
  end
end
