class MechanicalsUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :mechanical
end
