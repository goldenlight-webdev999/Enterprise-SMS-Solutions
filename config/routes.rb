Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  get 'submissions/new'
  get 'subscriptions/new'
  get 'contact', to: 'home#contact'
  get 'services/sms_api', to: 'home#sms_api', as: 'sms_api'
  get 'services/two_way_sms', to: 'home#two_way_sms' , as: 'two_way_sms'
  get 'services/pricing', to: 'home#pricing', as: 'pricing'
  get 'whatsapp_api', to: 'home#whatsapp_api'
  get 'whatsapp_page', to: 'home#whatsapp_page'
  get 'get_api_doc', to: 'home#get_api_doc'
  post '/cancel_subscriptions', to: 'cancel_subscriptions#cancel_plan'
  resources :payment_intents
  resources :payment_methods
  resources :submissions
  resources :subscriptions
end
