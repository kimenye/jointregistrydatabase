class CreatePatientProcedures < ActiveRecord::Migration
  def change
    create_table :patient_procedures do |t|
      t.string :name
      t.string :procedure_type
      t.references :surgery, index: true

      t.timestamps
    end
  end
end
