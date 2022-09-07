class CreatePolicytypes < ActiveRecord::Migration[6.1]
  def change
    create_table :policytypes do |t|
      t.string :name, null: false
      t.string :description
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
