class ImplantIndication < ActiveRecord::Base
	belongs_to :surgery
	# surgeries.includes(:implant_indication).map(&:implant_indications).flatten.uniq
	has_many :surgeries, :through => :implant_indication_sugery
  	has_many :implant_indication_sugery
end
