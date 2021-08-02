Rails.application.routes.draw do

  devise_for :users, controllers: {   
    registrations: 'users/registrations',
    confirmations: "users/confirmations",
    sessions: 'users/sessions' 
  }

  root 'homes#index'

  namespace :users do
    
    # ユーザー課金
    scope module: :payjp do
      resources :cards, except: [:new]
      namespace :plans do
        get 'choice', action: :choice
        get 'new_card', action: :new_card
        post 'confirm', action: :confirm
        post 'upgrade', action: :upgrade
        get 'complete', action: :complete
      end
    end
  end
end
