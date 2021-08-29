class CreateSums < ActiveRecord::Migration[6.0]
  def change
    create_table :sums do |t|
      t.timestamps
    end
  end
end
