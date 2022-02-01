Rails.application.routes.draw do

  root 'public/homes#top'

  #管理者
  devise_for :admin, skip: [:passwords] ,controllers: {
    sessions: 'admin/sessions',
  }
  #会員
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
  }
  namespace :admin do
    get 'admin/new', to: 'admin/sessions#new'
      resources :customers do
        
        collection do
          get 'customers/leave' => 'customers#leave'
          patch 'customers/out' => 'customers#out'
        end
      end
   
    resources :searches
      get "search" => "searches#search"
    resources :categories, only:[:index, :edit, :create, :update]
    resources :movies, only:[:show, :new, :index, :edit, :create, :update] do
    end
  end
  
  #genres
  namespace :public do
    resources :customers do
        collection do
          get 'customers/leave' => 'customers#leave'
          patch 'customers/out' => 'customers#out'
        end
    end
    get "movies_comment" => "movies_comment#index"
    resources :searches
      get "search" => "searches#search"
      resources :categories, only:[:index, :edit, :create, :update]
      resources :movies do
        resources :movies_comment
      end
  end
end
