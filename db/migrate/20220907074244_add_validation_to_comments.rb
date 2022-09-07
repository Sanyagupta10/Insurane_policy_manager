class AddValidationToComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :body, :string, null: false
  end
end
