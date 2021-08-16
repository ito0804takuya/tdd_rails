class CreateDollars < ActiveRecord::Migration[6.0]
  def change
    create_table :dollars do |t|
      t.timestamps
    end
  end
end
