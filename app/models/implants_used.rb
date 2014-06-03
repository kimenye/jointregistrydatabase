class ImplantsUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :manufacturer
  belongs_to :implant
  belongs_to :dimension
  belongs_to :implant_size
end
