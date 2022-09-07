class AddValidationToPolicies < ActiveRecord::Migration[6.1]
  def change
    change_column :policies, :policy_type, :string, null: false
    change_column :policies, :sum_insured, :decimal, null: false
    change_column :policies, :premium_amt, :decimal, null: false
    change_column :policies, :commission, :decimal, null: false
    change_column :policies, :purchase_date, :date, null: false 
    change_column :policies, :mature_date, :date, null: false 
  end
end
