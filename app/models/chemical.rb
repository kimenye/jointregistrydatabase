class Chemical < ActiveRecord::Base
	has_many :surgeries, :through => :chemicals_used
	has_many :chemicals_used
end
