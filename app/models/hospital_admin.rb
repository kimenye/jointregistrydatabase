class HospitalAdmin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :hospital
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
