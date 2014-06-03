class UsersController < ApplicationController
  before_filter :authenticate_super_admin!

  def index
    @hospital_admins = HospitalAdmin.all
    @surgeons = Surgeon.all
  end

  # def show
  #   @user = User.find(params[:id])
  # end
  
  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(params[:user], :as => :admin)
  #     redirect_to users_path, :notice => "User updated."
  #   else
  #     redirect_to users_path, :alert => "Unable to update user."
  #   end
  # end
    
  # def destroy
  #   user = User.find(params[:id])
  #   unless user == current_user
  #     user.destroy
  #     redirect_to users_path, :notice => "User deleted."
  #   else
  #     redirect_to users_path, :notice => "Can't delete yourself."
  #   end
  # end

  def approve_surgeons
    @surgeon = Surgeon.find(params[:id])
    @surgeon.approved = !@surgeon.approved
    @surgeon.save!
    if @surgeon.approved
      SuperAdminMailer.surgeon_approval_notification(@surgeon).deliver
    else
      SuperAdminMailer.surgeon_unapproval_notification(@surgeon).deliver
    end
    redirect_to users_path, notice: "Surgeon has been approved!"
  end

  def approve_hospital_admins
    @hospital_admin = HospitalAdmin.find(params[:id])
    @hospital_admin.approved = !@hospital_admin.approved
    @hospital_admin.save!
    if @hospital_admin.approved
      SuperAdminMailer.hospital_admin_approval_notification(@hospital_admin).deliver
    else
      SuperAdminMailer.hospital_admin_unapproval_notification(@hospital_admin).deliver
    end
    redirect_to users_path, notice: "Surgeon has been approved!"
  end
end
