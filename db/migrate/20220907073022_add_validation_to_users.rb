class AddValidationToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, null: false, limit: 50
    change_column :users, :email, :string, null: false
    change_column :users, :address, :string, limit: 100
    change_column :users, :contact_number, :integer 
  end
end
