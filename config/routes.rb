Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

  resources :items do
    collection do
      get 'search'
    end
  end

  get "/" => "public/homes#top"
  get "about" => "public/homes#about"
  get "items" => "public/items#index"
  get "items/genres/:id" => "public/items#genre_index", as: "items_genre_index"
  get "items/:id" => "public/items#show"
  get "customers" => "public/customers#show"
  patch "customers/unsubscribe" => "public/customers#unsubscribe"
  get "customers/edit" => "public/customers#edit"
  get "customers/unsubscribe/confirm" => "public/customers#confirm"
  get "cart_items" => "public/cart_items#index"
  post "cart_items" => "public/cart_items#create"
  patch "cart_items/:id" => "public/cart_items#update"
  delete "cart_items/:id" => "public/cart_items#destroy", as: 'cart_items_destroy'
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all", as: 'cart_items_destroy_all'
  get "orders/new" => "public/orders#new"
  post "orders/confirm" => "public/orders#confirm"
  get "orders/complete" => "public/orders#complete"
  get "orders/index" => "public/orders#index"
  get "orders/:id" => "public/orders#show"
  get "addresses" => "public/addresses#index"
  get "addresses/:id/edit" => "public/addresses#edit"
  post  "addresses" => "public/addresses#create"
  patch "addresses/:id" => "public/addresses#update"
  delete "addresses/:id" => "public/addresses#destroy"

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get "/" => "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
