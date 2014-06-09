# == Schema Information
#
# Table name: surgeries
#
#  id                 :integer          not null, primary key
#  patient_id         :integer
#  surgeon_id         :integer
#  date_of_surgery    :date
#  side               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  surgery_type       :string(255)
#  patient_position   :string(255)
#  total_hip_approach :string(255)
#  hospital_id        :integer
#  user_id            :integer
#

class Surgery < ActiveRecord::Base
  belongs_to :patient
  belongs_to :surgeon
  belongs_to :hospital
  has_many :anasthetic_types, :through => :anasthetics_used
  has_many :anasthetics_used
  has_many :chemicals_used
  has_many :chemicals, :through => :chemicals_used
  has_many :mechanicals, :through => :mechanicals_used
  has_many :mechanicals_used
  has_many :implant_indications, :through => :implant_indication_surgery
  has_many :implant_indication_sugery
  has_many :patient_procedures, :through => :procedures_used
  has_many :procedures_used
end
