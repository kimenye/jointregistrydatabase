class ProceduresUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :patient_procedure
end
