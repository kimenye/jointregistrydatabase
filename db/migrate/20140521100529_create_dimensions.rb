class CreateDimensions < ActiveRecord::Migration
  def change
    create_table :dimensions do |t|
      t.string :dimension_type
      t.references :implant, index: true

      t.timestamps
    end
  end
end
