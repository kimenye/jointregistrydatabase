class AddNjrCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :njr_code, :string
  end
end
