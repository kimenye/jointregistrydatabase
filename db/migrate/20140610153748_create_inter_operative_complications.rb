class CreateInterOperativeComplications < ActiveRecord::Migration
  def change
    create_table :inter_operative_complications do |t|
      t.string :name
      t.string :complication_type

      t.timestamps
    end
  end
end
