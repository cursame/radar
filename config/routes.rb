Rails.application.routes.draw do
  
  ############ home ###########
    root 'statics_views#home'
  ############ statics ###########
    get 'diagnostico', :to => 'statics_views#diagnostico', :as => :diagnostico
    get 'foco_rojo', :to => 'statics_views#foco_rojo', :as => :foco_rojo
    get 'nosotros', :to => 'statics_views#nosotros', :as => :nosotros
    get 'contacto', :to => 'statics_views#contacto', :as => :contacto
    get 'actualizaciones', :to => 'statics_views#actualizaciones', :as => :actualizaciones
    get 'lenguaje', :to => 'statics_views#lenguaje', :as => :lenguaje 

  ########### mail de contacto #########
    get 'mail_to_contact', :to => 'statics_views#mail_to_contact', :as => :mail_to_contact
    post '/statics_views/mail_to_contact'

  ########## mail de suscript ########
    get 'subscriber', :to => 'statics_views#subscriber', :as => :subscriber
    post '/statics_views/subscriber'

  ############ foco rojo ############
    resources :red_lights do 
      collection do 
        post 'dresser_attacks'
        post 'dresser_conflicts'
      end
    end

    get 'paginte_red_lights', :to => 'red_lights#paginate', :as => :red_lights_paginate
    get 'deliver_red_light', :to => 'red_lights#deliver_parts', :as => :deliver_parts
    post 'red_lights/deliver_parts'
    ############ rutas de formularios ######
    get 'dresser_attacks', :to =>  'red_lights#dresser_attacks', :as =>  :dresser_attacks 
    get 'dresser_conflicts', :to =>  'red_lights#dresser_conflicts', :as => :dresser_conflicts 
    get 'alert_point', :to => 'red_lights#alert_point', :as => :alert_point

    ############ json ##########
    get "/app/red_lights_js", :to => 'red_lights#red_lights_js', :as => :red_lights_js
  
  ########### usuario #############

    ########### metodos de posteo ##########
    resources :users do 
      collection do
        post 'session_create'
        post 'accept_in_radar'
        post 'deliver_resset_pass_instructions'
        post 'change_password'
      end
    end

    ########## rutas estaticas ###########
    get "register", :to => 'users#register', :as => :register
    get "session_create", :to => 'users#session_create', :as => :session_create
    get "login", :to => 'users#login', :as => :login
    get "accept_in_radar/:id", :to => 'users#accept_in_radar', :as => :accept_in_radar
    get "sign_out", :to => 'users#session_exit', :as => :session_exit
    get "mail_to_reconfirm_password", :to => 'users#mail_to_reconfirm_password', :as => :mail_to_reconfirm_password
    get "view_change_pass", :to => 'users#view_change_pass', :as => :view_change_pass
    get "configurate", :to => 'users#configurate', :as => :configurate
    get "edit_my_info", :to => 'users#edit', :as => :edit_my_info

    ######## metodos de institucion ######
    post 'institutions/update'
    post 'institutions/help_intitution_contact'
    get 'institutions/update'
    get 'institutions/edit', :as => :edit_institution
    get 'institutions/cancel', :as => :cancel_institution
    get 'institutions/help_intitution_contact'

    ####### metodos de comunicacion interna ##########

    post 'internal_comunication/create_comment'
    post 'internal_comunication/delete_comment'
    post 'internal_comunication/update_comment'
    get 'internal_comunication/create_comment'
    get 'internal_comunication/update_comment'
    get 'internal_comunication/delete_comment', :as => :delete_comment
    get 'internal_comunication/edit_comment', :as => :edit_comment

    ####### clear notices #########
    get 'internal_comunication/clear_notices'

    ####### usuarios de manejo de institucion manejo de metodos y atributos ##########
    get 'adviser_profile', :to => 'users#adviser_profile', :as => :adviser_profile
    get 'experts', :to => 'users#expert', :as => :experts

  ############ admin #########
    get 'management/applications', :as => :admin
    get 'management/hot_spots', :as => :admin_hot_spots
    get 'management/institutions', :as => :admin_institutions
    get 'management/users', :as => :admin_users
    get 'management/analitics', :as => :admin_analitics
    get 'management', to: 'management#applications'
    get 'admin', to: 'management#applications'
    get 'management/create_supervisor'
    post 'management/create_supervisor'
    get 'management/create_institution'
    post 'management/create_institution'

  ############ cuestionaries #########
    get 'questions/create'
    get 'questions/delete'
    get 'cuestions/create'
    get 'cuestions/delete'
    resources :cuestionaries
    get 'statics_views/home'
    get 'statics_views/panel'
    get 'port_access/new', :to => 'cuestionaries#new', as: :new_questionary
    get 'port_access/:id', :to => 'cuestionaries#view', as: :view_questionary
    get 'port_access', :to => 'cuestionaries#index', as: :school_questionary
    get 'responce', :to => 'cuestionaries#responce', as: :responce_questionary
    get  '/cuestionaries/filter_repsonces'
    post '/cuestionaries/filter_repsonces'
    post '/cuestionaries/responce'
    get '/view_responces/:responce_quest', :to => 'cuestionaries#view_responces', as: :view_responces
    get 'auto_diagnostico', :to => 'cuestionaries#auto_diagnostico', as: :auto_diagnostico
    get 'cuestionaries/filter_to_acces_responce'
    post 'cuestionaries/filter_to_acces_responce'
    get 'code_filter', :to => 'cuestionaries#code_filter', as: :code_filter

  ####### api ########
    get 'api/documentation_methods', as: :document_api
    get 'api/acces_to_red_lights'
    get 'api/register_by_api'
    post 'api/register_by_api'
    get 'api/session_loggin'
    post 'api/session_loggin'

   get '*path', to: redirect("/%{path}?locale=#{I18n.default_locale}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
   get '', to: redirect("?locale=#{I18n.default_locale}")

end
