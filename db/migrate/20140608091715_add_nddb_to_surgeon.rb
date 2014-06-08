class AddNddbToSurgeon < ActiveRecord::Migration
  def change
    add_column :surgeons, :registration_code, :string
  end
end
