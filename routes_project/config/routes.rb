Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create ,:index, :show, :update, :destroy] do 

    resources :artworks, only: [:index]

  end

  resources :artworks, only: [:create, :index, :show, :update, :destroy]

  resources :artwork_shares, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy, :index]

    

  

end
