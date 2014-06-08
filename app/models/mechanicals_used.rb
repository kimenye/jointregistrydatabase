# == Schema Information
#
# Table name: mechanicals_useds
#
#  id            :integer          not null, primary key
#  surgery_id    :integer
#  mechanical_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class MechanicalsUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :mechanical
end
