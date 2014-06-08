# == Schema Information
#
# Table name: patient_procedures
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  procedure_type :string(255)
#  surgery_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class PatientProcedure < ActiveRecord::Base
  belongs_to :surgery
  has_many :surgeries, :through => :procedures_used
  has_many :procedures_used
end
