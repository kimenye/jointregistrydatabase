class PatientProcedure < ActiveRecord::Base
  belongs_to :surgery
  has_many :surgeries, :through => :procedures_used
  has_many :procedures_used
end
