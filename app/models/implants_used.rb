# == Schema Information
#
# Table name: implants_useds
#
#  id              :integer          not null, primary key
#  surgery_id      :integer
#  manufacturer_id :integer
#  implant_id      :integer
#  dimension_id    :integer
#  implant_size_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class ImplantsUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :manufacturer
  belongs_to :implant
  belongs_to :dimension
  belongs_to :implant_size
end
