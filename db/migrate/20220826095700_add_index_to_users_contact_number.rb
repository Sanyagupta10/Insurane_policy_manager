class AddIndexToUsersContactNumber < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :contact_number, unique: true
  end
end
