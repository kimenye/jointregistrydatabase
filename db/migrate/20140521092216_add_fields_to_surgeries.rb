class AddFieldsToSurgeries < ActiveRecord::Migration
  def change
    add_column :surgeries, :patient_position, :string
    add_column :surgeries, :total_hip_approach, :string
  end
end
