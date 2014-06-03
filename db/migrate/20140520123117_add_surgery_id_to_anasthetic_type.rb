class AddSurgeryIdToAnastheticType < ActiveRecord::Migration
  def change
    add_column :anasthetic_types, :surgery_id, :integer, index: true
  end
end
