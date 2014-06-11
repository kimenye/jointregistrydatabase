class AddFieldsToHospital < ActiveRecord::Migration
  def change
    add_column :hospitals, :website, :string
    add_column :hospitals, :email, :string
    add_column :hospitals, :approved, :boolean
  end
end
