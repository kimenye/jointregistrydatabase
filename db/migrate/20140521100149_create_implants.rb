class CreateImplants < ActiveRecord::Migration
  def change
    create_table :implants do |t|
      t.string :name
      t.string :implant_type
      t.references :manufacturer, index: true

      t.timestamps
    end
  end
end
