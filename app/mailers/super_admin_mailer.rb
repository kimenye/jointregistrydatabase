class SuperAdminMailer < ActionMailer::Base

	def user_approval(user)
    begin
      @user = user
      mail(:from => user.email, :to => "Super Admin <#{User.first.email}>", :subject => "New User Awaiting Approval")
    rescue

    end
  end

  def user_approval_notification(user)
    begin
      @user = user
      mail(:from => User.first.email, :to => "#{user.email} <#{user.email}>", :subject => "Congratulations! You have been approved.")
    rescue

    end
  end

  def user_unapproval_notification(user)
    begin
      @user = user
      mail(:from => User.first.email, :to => "#{user.email} <#{user.email}>", :subject => "Your account has been unapproved!")
    rescue

    end
  end
end