class AddSurgeryIdToImplantIndication < ActiveRecord::Migration
  def change
    add_column :implant_indications, :surgery_id, :integer, index: true
  end
end
