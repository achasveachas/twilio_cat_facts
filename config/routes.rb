Rails.application.routes.draw do
  
  resources :cat_facts, only: [:create, :index]

end
