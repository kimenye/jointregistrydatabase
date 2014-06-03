class AddHospitalIdToSurgery < ActiveRecord::Migration
  def change
    add_reference :surgeries, :hospital, index: true
  end
end
