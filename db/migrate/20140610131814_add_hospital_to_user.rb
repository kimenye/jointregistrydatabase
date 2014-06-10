class AddHospitalToUser < ActiveRecord::Migration
  def change
	add_reference :users, :hospital, index: true
  end
end
