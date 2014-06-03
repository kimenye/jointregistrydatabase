class DropFieldsFromSurgery < ActiveRecord::Migration
  def change
  	remove_column :surgeries, :anasthetic_type_id
  	remove_column :surgeries, :chemical_id
  	remove_column :surgeries, :mechanical_id
  	remove_column :surgeries, :implant_indication_id
  end
end
