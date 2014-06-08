# == Schema Information
#
# Table name: implant_indication_surgeries
#
#  id                    :integer          not null, primary key
#  surgery_id            :integer
#  implant_indication_id :integer
#  created_at            :datetime
#  updated_at            :datetime
#

class ImplantIndicationSurgery < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :implant_indication
end
