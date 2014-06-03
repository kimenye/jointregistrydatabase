class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :medical_record_number
      t.string :name
      t.date :date_of_birth
      t.string :gender
      t.integer :weight
      t.integer :height
      t.string :race
      t.string :postcode
      t.string :nhif_number

      t.timestamps
    end
  end
end
