Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root "posts#index"
  resources :users, only: %i(index show)
  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :photos, only: [:create]
    resources :likes, shallow: true
  end
  resources :streams
  resources :rooms
  match '/party/:id', :to => "rooms#party", :as => :party, :via => :get
end
