class AddSurgeryIdToMechanical < ActiveRecord::Migration
  def change
    add_column :mechanicals, :surgery_id, :integer, index: true
  end
end
