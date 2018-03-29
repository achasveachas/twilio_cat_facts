Rails.application.routes.draw do
  
  post 'twilio/sms'

  resources :cat_facts, only: [:create, :index]

end
