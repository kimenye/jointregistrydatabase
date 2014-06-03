class ChangeSomePatientFields < ActiveRecord::Migration
  def change
  	change_column :patients, :medical_record_number, :string
  	rename_column :patients, :nhif_number, :id_number
  end
end
