class Patient < ActiveRecord::Base
	has_many :surgeries
end
