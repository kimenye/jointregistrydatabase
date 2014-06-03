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
  has_many :implant_indications, :through => :implant_indication_sugery
  has_many :implant_indication_sugery
  has_many :patient_procedures, :through => :procedures_used
  has_many :procedures_used
end
