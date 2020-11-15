Rails.application.routes.draw do
  devise_for :users
  get 'site/index'
  get 'site/login'
  post 'site/mail'
  get '/', to: 'site#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
    resources :hotels
    resources :users do
      collection do
        post 'login'
      end
    end
  end
end
    
