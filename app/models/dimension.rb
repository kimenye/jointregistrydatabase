# == Schema Information
#
# Table name: dimensions
#
#  id             :integer          not null, primary key
#  dimension_type :string(255)
#  implant_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Dimension < ActiveRecord::Base
  belongs_to :implant
  has_many :implant_sizes

  #def name
  #	"#{implant.name} - #{dimension_type}"
  #end

  def name
   if !implant.nil?
     return	"#{implant.name} - #{dimension_type}"
   end
  end
end
