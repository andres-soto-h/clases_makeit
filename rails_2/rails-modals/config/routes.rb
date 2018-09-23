Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :products
    end
  end
  devise_for :users
  resources :products
  root 'products#index'
  get 'products/alert_js'
  get 'alert', to: 'products#alert_js', as: 'alert_js'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
