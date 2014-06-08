# == Schema Information
#
# Table name: mechanicals
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  surgery_id :integer
#

class Mechanical < ActiveRecord::Base
	belongs_to :surgery
	has_many :surgeries, :through => :mechanicals_used
  	has_many :mechanicals_used
end
