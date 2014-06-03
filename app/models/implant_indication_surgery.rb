class ImplantIndicationSurgery < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :implant_indication
end
