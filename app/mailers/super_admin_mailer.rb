class SuperAdminMailer < ActionMailer::Base

	def user_approval(user)
    begin
      @user = user
      mail(:from => "info@jointregistry.co.ke", :to => "Super Admin <#{User.where(user_type: "SuperAdmin").first.email}>", :subject => "New Joint Registry Surgeon Awaiting Approval")
    rescue

    end
  end

  def user_approval_notification(user)
    begin
      @user = user
      mail(:from => "info@jointregistry.co.ke", :to => "#{user.email} <#{user.email}>", :subject => "Congratulations! You have been approved.")
    rescue

    end
  end

  def user_unapproval_notification(user)
    begin
      @user = user
      mail(:from => "info@jointregistry.co.ke", :to => "#{user.email} <#{user.email}>", :subject => "Your account has been unapproved!")
    rescue

    end
  end
end