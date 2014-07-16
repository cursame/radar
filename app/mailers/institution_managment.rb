class InstitutionManagment < ActionMailer::Base
  default from: "RADAR@radarescolar.com"

   def create_notification(user)
    @user = user
    mail(to: @user.email, subject: 'Bienbenido a RADAR')
   end

end
