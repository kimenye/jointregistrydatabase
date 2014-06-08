# == Schema Information
#
# Table name: procedures_useds
#
#  id                   :integer          not null, primary key
#  surgery_id           :integer
#  patient_procedure_id :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class ProceduresUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :patient_procedure
end
