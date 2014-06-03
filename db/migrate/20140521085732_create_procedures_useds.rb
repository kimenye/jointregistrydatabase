class CreateProceduresUseds < ActiveRecord::Migration
  def change
    create_table :procedures_useds do |t|
      t.references :surgery, index: true
      t.references :patient_procedure, index: true

      t.timestamps
    end
  end
end
