class CreatePolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :policies do |t|
      t.string :policy_type, null: false
      t.string :description
      t.decimal :sum_insured, null: false
      t.decimal :premium_amt, null: false
      t.decimal :commission
      t.date :purchase_date, null: false
      t.date :mature_date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :policytype, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
