# == Schema Information
#
# Table name: surgery_complications
#
#  id                              :integer          not null, primary key
#  inter_operative_complication_id :integer
#  surgery_id                      :integer
#  created_at                      :datetime
#  updated_at                      :datetime
#

class SurgeryComplication < ActiveRecord::Base
  belongs_to :inter_operative_complication
  belongs_to :surgery
end
