# == Schema Information
#
# Table name: chemicals_useds
#
#  id          :integer          not null, primary key
#  surgery_id  :integer
#  chemical_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class ChemicalsUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :chemical
end
