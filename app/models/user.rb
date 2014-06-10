# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  registration_code      :string(255)
#  name                   :string(255)
#  user_type              :string(255)
#  phone_number           :string(255)
#  approved               :boolean
#  hospital_id            :integer
#  njr_code               :string(255)
#  title                  :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :hospital

  after_create :send_super_admin_mail
  def send_super_admin_mail
    SuperAdminMailer.user_approval(self).deliver
    self.njr_code = generate_unique_registration_code
    self.save!
  end

  def generate_unique_registration_code
    cs = [*'0'..'9', *'a'..'z', *'A'..'Z']-['O']-['I']-['1']-['0']-['i']-['o']
    6.times.map { cs.sample }.join.upcase
  end

  def active_for_authentication? 
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end 
  end
end
