class CreateMechanicals < ActiveRecord::Migration
  def change
    create_table :mechanicals do |t|
      t.string :name

      t.timestamps
    end
  end
end
