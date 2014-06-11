class AddFieldsToManufacturer < ActiveRecord::Migration
  def change
    add_column :manufacturers, :website, :string
    add_column :manufacturers, :email, :string
    add_column :manufacturers, :approved, :boolean
  end
end
