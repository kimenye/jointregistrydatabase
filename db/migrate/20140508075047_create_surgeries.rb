class CreateSurgeries < ActiveRecord::Migration
  def change
    create_table :surgeries do |t|
      t.references :patient, index: true
      t.references :surgeon, index: true
      t.date :date_of_surgery
      t.string :side

      t.timestamps
    end
  end
end
