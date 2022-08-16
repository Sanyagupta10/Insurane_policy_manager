class CreatePolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :policies do |t|
      t.string :policy_type
      t.string :description
      t.decimal :sum_insured
      t.decimal :premium_amt
      t.decimal :commission
      t.date :purchase_date
      t.date :mature_date
      t.references :user, null: false, foreign_key: true
      t.references :policytype, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
