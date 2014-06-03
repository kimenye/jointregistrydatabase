class CreateChemicalsUseds < ActiveRecord::Migration
  def change
    create_table :chemicals_useds do |t|
      t.references :surgery, index: true
      t.references :chemical, index: true

      t.timestamps
    end
  end
end
