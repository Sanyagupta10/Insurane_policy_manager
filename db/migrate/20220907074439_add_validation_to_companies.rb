class AddValidationToCompanies < ActiveRecord::Migration[6.1]
  def change
    change_column :companies, :name, :string, null: false
    change_column :companies, :description, :string, null: false
  end
end
