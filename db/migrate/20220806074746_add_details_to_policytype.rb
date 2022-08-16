class AddDetailsToPolicytype < ActiveRecord::Migration[6.1]
  def change
    add_column :policytypes, :duration, :integer
    add_column :policytypes, :premium_amt, :decimal
    add_column :policytypes, :sum_insured, :decimal
  end
end
