# == Schema Information
#
# Table name: patients
#
#  id                    :integer          not null, primary key
#  medical_record_number :string(255)
#  name                  :string(255)
#  date_of_birth         :date
#  gender                :string(255)
#  weight                :integer
#  height                :integer
#  race                  :string(255)
#  postcode              :string(255)
#  id_number             :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

class Patient < ActiveRecord::Base
	has_many :surgeries
end
