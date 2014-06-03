class CreateMechanicalsUseds < ActiveRecord::Migration
  def change
    create_table :mechanicals_useds do |t|
      t.references :surgery, index: true
      t.references :mechanical, index: true

      t.timestamps
    end
  end
end
