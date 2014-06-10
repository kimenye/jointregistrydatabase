class ChangeImplantSizeMeasurementToString < ActiveRecord::Migration
  def change
    change_column :implant_sizes, :measurement, :string
  end
end
