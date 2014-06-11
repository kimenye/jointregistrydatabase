class AddLogoToHospitals < ActiveRecord::Migration
  def self.up
    add_attachment :hospitals, :logo
  end

  def self.down
    remove_attachment :hospitals, :logo
  end
end
