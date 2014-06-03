class AnastheticsUsed < ActiveRecord::Base
  belongs_to :surgery
  belongs_to :anasthetic_type
end
