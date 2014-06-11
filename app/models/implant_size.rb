# == Schema Information
#
# Table name: implant_sizes
#
#  id           :integer          not null, primary key
#  dimension_id :integer
#  measurement  :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class ImplantSize < ActiveRecord::Base
  belongs_to :dimension
end
