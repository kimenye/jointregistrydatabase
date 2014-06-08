# == Schema Information
#
# Table name: chemicals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Chemical < ActiveRecord::Base
	has_many :surgeries, :through => :chemicals_used
	has_many :chemicals_used
end
