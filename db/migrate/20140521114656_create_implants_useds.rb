class CreateImplantsUseds < ActiveRecord::Migration
  def change
    create_table :implants_useds do |t|
      t.references :surgery, index: true
      t.references :manufacturer, index: true
      t.references :implant, index: true
      t.references :dimension, index: true
      t.references :implant_size, index: true

      t.timestamps
    end
  end
end
