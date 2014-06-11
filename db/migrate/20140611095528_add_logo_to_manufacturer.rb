class AddLogoToManufacturer < ActiveRecord::Migration
  def self.up
    add_attachment :manufacturers, :logo
  end

  def self.down
    remove_attachment :manufacturers, :logo
  end
end
