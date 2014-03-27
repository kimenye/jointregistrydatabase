class UsersController < ApplicationController
  # before_filter :authenticate_super_admin!

  def index
    # authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @hospital_admins = HospitalAdmin.all
    @surgeons = Surgeon.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    # authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    # authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def approve(user)
    @user = user #.find(params[:id])
    @user.approved = !@user.approved
    @user.save!
    redirect_to dashboard_index_path, notice: "User has been approved!"
  end
end
