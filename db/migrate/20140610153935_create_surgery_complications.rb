class CreateSurgeryComplications < ActiveRecord::Migration
  def change
    create_table :surgery_complications do |t|
      t.references :inter_operative_complication, index: true
      t.references :surgery, index: true

      t.timestamps
    end
  end
end
