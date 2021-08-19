class CreateFrancs < ActiveRecord::Migration[6.0]
  def change
    create_table :francs do |t|
      t.integer :amount
      t.timestamps
    end
  end
end
