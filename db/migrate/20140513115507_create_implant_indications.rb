class CreateImplantIndications < ActiveRecord::Migration
  def change
    create_table :implant_indications do |t|
      t.string :name

      t.timestamps
    end
  end
end
