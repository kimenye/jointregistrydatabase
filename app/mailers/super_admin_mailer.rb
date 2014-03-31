class SuperAdminMailer < ActionMailer::Base

	def surgeon_approval(user)
	 begin
       @user = user
       mail(:from => user.email, :to => "Super Admin <#{SuperAdmin.first.email}>", :subject => "New User Awaiting Approval")
     rescue
     #  Do nothing
     end
	end

	def hospital_admin_approval(user)
	 begin
       @user = user
       mail(:from => user.email, :to => "Super Admin <#{SuperAdmin.first.email}>", :subject => "New User Awaiting Approval")
     rescue
     #  Do nothing
     end
	end

	def surgeon_approval_notification(user)
	 begin
       @user = user
       mail(:from => SuperAdmin.first.email, :to => "#{user.email} <#{user.email}>", :subject => "Congratulations! You have been approved.")
     rescue
     #  Do nothing
     end
	end

	def surgeon_unapproval_notification(user)
	 begin
       @user = user
       mail(:from => SuperAdmin.first.email, :to => "#{user.email} <#{user.email}>", :subject => "Your account has been unapproved!")
     rescue
     #  Do nothing
     end
	end

	def hospital_admin_approval_notification(user)
	 begin
       @user = user
       mail(:from => SuperAdmin.first.email, :to => "#{user.email} <#{user.email}>", :subject => "Congratulations! You have been approved.")
     rescue
     #  Do nothing
     end
	end

	def hospital_admin_unapproval_notification(user)
	 begin
       @user = user
       mail(:from => SuperAdmin.first.email, :to => "#{user.email} <#{user.email}>", :subject => "Your account has been unapproved!")
     rescue
     #  Do nothing
     end
	end
end