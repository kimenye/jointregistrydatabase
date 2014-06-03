class AnastheticType < ActiveRecord::Base
	belongs_to :surgery
	has_many :surgeries, :through => :anasthetics_used
  	has_many :anasthetics_used
end
