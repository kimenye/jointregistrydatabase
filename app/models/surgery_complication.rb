class SurgeryComplication < ActiveRecord::Base
  belongs_to :inter_operative_complication
  belongs_to :surgery
end
