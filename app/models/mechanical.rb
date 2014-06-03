class Mechanical < ActiveRecord::Base
	belongs_to :surgery
	has_many :surgeries, :through => :mechanicals_used
  	has_many :mechanicals_used
end
