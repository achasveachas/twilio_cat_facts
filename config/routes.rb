Rails.application.routes.draw do
  
  get 'twilio/sms'

  resources :cat_facts, only: [:create, :index]

end
