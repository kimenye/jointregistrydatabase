class CreateImplantSizes < ActiveRecord::Migration
  def change
    create_table :implant_sizes do |t|
      t.references :dimension, index: true
      t.float :measurement

      t.timestamps
    end
  end
end
