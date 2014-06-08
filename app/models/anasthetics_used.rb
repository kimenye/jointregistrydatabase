# == Schema Information
#
# Table name: anasthetics_useds
#
#  id                 :integer          not null, primary key
#  surgery_id         :integer
#  anasthetic_type_id :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class AnastheticsUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :anasthetic_type
end
