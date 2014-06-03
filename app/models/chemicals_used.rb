class ChemicalsUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :chemical
end
