class UserMailer < ActionMailer::Base

  def organizationRegistration(organization)
    @user = organization.users.find_by(:roles => "Admin")
    mail(:from => "niwant.techvision@gmail.com", :to => @user.email, :subject => "Thank you for registering with joshintranet.com", :template_path => "user_mailer", :template_name => "organization_registration")
  end  

  def assignLeaveReport(user)
    @user = user
    if @user.roles == "Admin"
      mail(:from => "niwant.techvision@gmail.com", :to => @user.email, :subject => "Assign leave report", :template_path => "user_mailer", :template_name => "assign_leaves_report_on_admin")
    else
      mail(:from => "niwant.techvision@gmail.com", :to => @user.email, :subject => "Assign leave report", :template_path => "user_mailer", :template_name => "assign_leaves_report_on_user")
    end
  end

  def leaveReport(leave, user, user_role)
    @user = user
    @leave = leave
    @user_role = user_role
    mail(:from => "niwant.techvision@gmail.com", :to => @user_role, :subject => "Apply leave", :template_path => "user_mailer", :template_name => "emailMessage")
  end

  def rejectStatusLeave(leave, user)
    @user = user
    @leave = leave
    mail(:from => "niwant.techvision@gmail.com", :to => @leave.user.email, :subject => ' Leave has been rejected', :template_path => 'user_mailer', :template_name => 'reject')
    end

      def approveLeave(leave, user)
        @leave = leave
        @user = user
        mail(:from => "niwant.techvision@gmail.com", :to => @leave.user.email, :subject => "Leave has been approve", :template_path => "user_mailer", :template_name => "appr")
      end

      def cansleLeave(leave, user)
        @leave = leave
        @user = user
        mail(:from => "niwant.techvision@gmail.com", :to => @leave.user.email, :subject => ' Your Leave has been canseld', :template_path => 'user_mailer', :template_name => 'cansleLeave')
	      end
	          def destroyLeave(user, user_r)
		        @user = user
      @user_r = user_r
      mail(:from => "niwant.techvision@gmail.com", :to => @user_r, :subject => 'Canselation of leave', :template_path => 'user_mailer', :template_name => 'destroyLeave')
          end

  def send_leave(user_admin, user, leave)
  @admin = user_admin
#@another_user = another_user
@leave = leave
@user = user
      mail(:from => "niwant.techvision@gmail.com", :to => @user, :subject => 'Your Remening leaves', :template_path => 'user_mailer', :template_name => 'send_leave')
      end
        def send_mail_to_admin(admin, user)
	    @admin = admin
	        @user = user
      mail(:from => "niwant.techvision@gmail.com", :to => @admin, :subject => 'employees leaves', :template_path => 'user_mailer', :template_name => 'send_mail_to_admin')
  end
    def extra_leave(leave)
        @leave = leave
mail(:from => "niwant.techvision@gmail.com", :to => @leave.user.email, :subject => 'Leaves quota is over.', :template_path => 'user_mailer', :template_name => 'extra_leave')
  end
  def date_of_birth(user, admin, date)
      @user = user
          @admin = admin
    @date = date
	  mail(:from => "niwant.techvision@gmail.com", :to => @admin, :subject => 'birthday notification of employees', :template_path => 'user_mailer', :template_name => 'date_of_birth')
  end
  def email_of_probation(admin, user, date)
      @admin = admin
          @user = user
	      @date = date
	  mail(:from => "niwant.techvision@gmail.com", :to => @admin, :subject => 'Notification for end of probation perade of employee', :template_path => 'user_mailer', :template_name => 'email_of_probation')
  end
  end
