# == Schema Information
#
# Table name: hospitals
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  location          :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  website           :string(255)
#  email             :string(255)
#  approved          :boolean
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Hospital < ActiveRecord::Base
	# has_attached_file :photo,
 #    :default_url => "/assets/eu.png"
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
	# has_one :hospital_admin
	has_many :surgeries
end
