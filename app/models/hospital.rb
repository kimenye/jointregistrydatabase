class Hospital < ActiveRecord::Base
	has_one :hospital_admin
	has_many :surgeries
end
