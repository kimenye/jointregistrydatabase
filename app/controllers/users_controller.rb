class UsersController < ApplicationController
  before_filter :is_user_admin?

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def approve_users
    @user = User.find(params[:id])
    @user.approved = !@user.approved
    @user.save!
    if @user.approved
      SuperAdminMailer.user_approval_notification(@user).deliver
    else
      SuperAdminMailer.user_unapproval_notification(@user).deliver
    end
    redirect_to users_path, notice: "User has been approved!"
  end

  private
    def is_user_admin?
      super_admin = User.where(user_type: "SuperAdmin").first
      unless current_user == super_admin
        sign_out current_user
        redirect_to root_path, notice: "You need to sign in as the Super Admin"
      end
    end
end
