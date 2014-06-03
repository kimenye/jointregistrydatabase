class AddFieldsToSurgery < ActiveRecord::Migration
  def change
    add_reference :surgeries, :anasthetic_type, index: true
    add_reference :surgeries, :chemical, index: true
    add_reference :surgeries, :mechanical, index: true
    add_reference :surgeries, :implant_indication, index: true
  end
end
