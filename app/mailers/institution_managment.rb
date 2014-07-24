class InstitutionManagment < ActionMailer::Base
  default from: "RADAR@radarescolar.com"

   def create_notification(user)
     @user = user
   	 mail(to: @user.email, subject: 'Bienbenido a RADAR')
   end

   def red_alert(owner)
   	 @user = owner
   	 mail(to: @user.email, subject: 'Tienes una nueva alerta en tu muro')
   end

   def contact(message, person_data)
   	 @person_data = person_data
     @message = message
   	 mail(to: 'alfredo@cursa.me', subject: 'Email de contacto')
   end
end
