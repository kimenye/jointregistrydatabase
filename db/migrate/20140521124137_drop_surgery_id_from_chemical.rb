class DropSurgeryIdFromChemical < ActiveRecord::Migration
  def change
  	remove_column :chemicals, :surgery_id
  end
end
