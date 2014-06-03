class CreateImplantIndicationSurgeries < ActiveRecord::Migration
  def change
    create_table :implant_indication_surgeries do |t|
      t.references :surgery, index: true
      t.references :implant_indication, index: true

      t.timestamps
    end
  end
end
