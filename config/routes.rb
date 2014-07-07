Rails.application.routes.draw do
  
  ############ home ###########
  root 'statics_views#home'

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
    end
  end

  get "register", :to => 'users#register', :as => :register
  get "session_create", :to => 'users#session_create', :as => :session_create
  get "login", :to => 'users#login', :as => :login


  ############ cuestionaries #########
  get 'questions/create'

  get 'questions/delete'

  get 'cuestions/create'

  get 'cuestions/delete'

  resources :cuestionaries


  get 'statics_views/home'

  get 'statics_views/panel'

end
