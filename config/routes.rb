Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/search" => "pages#search", :as => "search_page"
  get "/news" => "pages#news", :as => "news_page"
  get "/community" => "pages#community", :as => "community_page"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    member do
      post :to_read
      post :read
      post :wish
      post :add_challenges
      delete :unlist
    end
    resources :reviews
  end


  resources :users, only: [] do
    collection do get :profile end
  end
end
