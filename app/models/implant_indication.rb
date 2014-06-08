# == Schema Information
#
# Table name: implant_indications
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  surgery_id :integer
#

class ImplantIndication < ActiveRecord::Base
	# belongs_to :surgery
	# surgeries.includes(:implant_indication).map(&:implant_indications).flatten.uniq
	has_many :surgeries, :through => :implant_indication_surgery
  	has_many :implant_indication_surgery
end
