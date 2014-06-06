class AddTjrCodeToSurgeons < ActiveRecord::Migration
  def change
    add_column :surgeons, :tjr_code, :string
  end
end
