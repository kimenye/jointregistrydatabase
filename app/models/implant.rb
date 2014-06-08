# == Schema Information
#
# Table name: implants
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  implant_type    :string(255)
#  manufacturer_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Implant < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :dimensions
end
