Rails.application.routes.draw do
  get 'statics_views/home'

  get 'statics_views/panel'
  
  root 'statics_views#home'
end
