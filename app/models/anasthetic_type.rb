# == Schema Information
#
# Table name: anasthetic_types
#
#  id              :integer          not null, primary key
#  anasthetic_type :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  surgery_id      :integer
#

class AnastheticType < ActiveRecord::Base
	belongs_to :surgery
	has_many :surgeries, :through => :anasthetics_used
  	has_many :anasthetics_used
end
