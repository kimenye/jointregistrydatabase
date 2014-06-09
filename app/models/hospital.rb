# == Schema Information
#
# Table name: hospitals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Hospital < ActiveRecord::Base
	# has_one :hospital_admin
	has_many :surgeries
end
