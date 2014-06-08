class AddSurgeonInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :registration_code, :string
    add_column :users, :name, :string
    add_column :users, :user_type, :string
  end
end
