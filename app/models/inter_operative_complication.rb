# == Schema Information
#
# Table name: inter_operative_complications
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  complication_type :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class InterOperativeComplication < ActiveRecord::Base
end
