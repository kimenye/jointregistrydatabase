class Dimension < ActiveRecord::Base
  belongs_to :implant
  has_many :implant_sizes
end
