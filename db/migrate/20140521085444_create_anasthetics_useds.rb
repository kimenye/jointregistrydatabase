class CreateAnastheticsUseds < ActiveRecord::Migration
  def change
    create_table :anasthetics_useds do |t|
      t.references :surgery, index: true
      t.references :anasthetic_type, index: true

      t.timestamps
    end
  end
end
