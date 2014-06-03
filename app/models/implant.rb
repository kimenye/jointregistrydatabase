class Implant < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :dimensions
end
