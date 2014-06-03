class AddSurgeryIdToChemical < ActiveRecord::Migration
  def change
    add_column :chemicals, :surgery_id, :integer, index: true
  end
end
