class InstitutionManagment < ActionMailer::Base
  default from: "RADAR@radarescolar.com"

   def create_notification(user)
     @user = user
   	 mail(to: @user.email, subject: 'Bienvenido a RADAR')
   end

   def reset_password(user, link)
      @user = user
      @link = link
      mail(to: @user.email, subject: 'Instrucciones de cambio de contraseña')
   end

   def notificate_password_change(user)
      @user = user
      mail(to: @user.email, subject: 'Notificación de cambio de contraseña satisfactorio')
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

   def contact_institutions(user, institution_to, title, description)
     @i_t = institution_to
     @user = user
     @institution = @user.institutions.first
     @title = title
     @description = description
     mail(to: @i_t.email , subject: 'Solicitud de ayuda de para una intitución con problemas de bullying')
   end

   def comment_to_problem(user, institution_to, id)
     @user = user
     @institution = institution_to
     @id = id
     mail(to: @user.email , subject: 'Se ha comentado una solicitud de ayuda')
   end

   def mail_to_supervisor(user, password)
     @user = user
     @password = password
     mail(to: @user.email, subject: 'Bienvenido asesor experto')
   end

   def red_alert_to_supervisor(owner)
     @user = owner
     mail(to: @user.email, subject: 'Hay una urgencia de bullying en una escuela')
   end
end
