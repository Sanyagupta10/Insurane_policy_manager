class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.integer :user
      t.references :policy, foreign_key: true

      t.timestamps
    end
  end
end
