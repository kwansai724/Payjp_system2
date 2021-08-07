Rails.application.routes.draw do

  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }

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
        post 'upgrade', action: :upgrade
        post 'confirm', action: :confirm
      end
    end
  end

  # 管理者ページ
  namespace :admins do
    scope module: :payjp do
      get 'index', action: :index
      get 'user_index', action: :user_index
      get 'user_show', action: :user_show
    end
  end

  # その他
  get  "use"  => "use#index"

end
