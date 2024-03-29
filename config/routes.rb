Rails.application.routes.draw do  
  
  root 'tests#index'
  
  devise_for :users, controllers: { sessions: 'users/sessions' }, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
    
  #resources :users, only: :create
  #resources :sessions, only: :create

  resources :tests, only: :index do
    post :start, on: :member
  end

  
  resources :test_passages, only: %i[create show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :contacts, only: %i[new create]
  
  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
