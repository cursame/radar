Rails.application.routes.draw do
  
  ############ home ###########
  root 'statics_views#home'
  ############ statics ###########
  get 'diagnostico', :to => 'statics_views#diagnostico', :as => :diagnostico
  get 'foco_rojo', :to => 'statics_views#foco_rojo', :as => :foco_rojo
  get 'nosotros', :to => 'statics_views#nosotros', :as => :nosotros
  get 'contacto', :to => 'statics_views#contacto', :as => :contacto
  ########### mail de contacto #########
  get 'mail_to_contact', :to => 'statics_views#mail_to_contact', :as => :mail_to_contact
  post '/statics_views/mail_to_contact'

  ############ foco rojo ############

  resources :red_lights do 
    collection do 
      post 'dresser_attacks'
      post 'dresser_conflicts'
    end
  end


  get 'dresser_attacks', :to =>  'red_lights#dresser_attacks', :as =>  :dresser_attacks 
  get 'dresser_conflicts', :to =>  'red_lights#dresser_conflicts', :as => :dresser_conflicts 
  get 'alert_point', :to => 'red_lights#alert_point', :as => :alert_point

  resources :users do 
    collection do
      post 'session_create'
      post 'accept_in_radar'
    end
  end

  get "register", :to => 'users#register', :as => :register
  get "session_create", :to => 'users#session_create', :as => :session_create
  get "login", :to => 'users#login', :as => :login
  get "accept_in_radar/:id", :to => 'users#accept_in_radar', :as => :accept_in_radar
  get "sign_out", :to => 'users#session_exit', :as => :session_exit
  ############ json ##########

  get "/app/red_lights_js", :to => 'red_lights#red_lights_js', :as => :red_lights_js

  ############ admin #########
  get 'management/applications', :as => :admin

  get 'management/hot_spots', :as => :admin_hot_spots

  get 'management/institutions', :as => :admin_institutions

  get 'management/users', :as => :admin_users

  get 'management/analitics', :as => :admin_analitics



  ############ cuestionaries #########
  get 'questions/create'

  get 'questions/delete'

  get 'cuestions/create'

  get 'cuestions/delete'

  resources :cuestionaries


  get 'statics_views/home'

  get 'statics_views/panel'

end
