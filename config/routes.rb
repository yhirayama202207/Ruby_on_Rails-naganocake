Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
  }

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # resources :items do
  #   collection do
  #     get 'search'
  #   end
  # end

  scope module: :public do
    get "/" => "homes#top", as: "homes_top"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :addresses
    resources :cart_items, only: [:index, :update, :destroy, :create]
    resources :orders, only: [:new, :create, :index, :show]
  end

  get "/" => "public/homes#top"
  get "about" => "public/homes#about"
  get "items" => "public/items#index", as: "items"
  get "items/genres/:id" => "public/items#genre_index", as: "items_genre_index"
  get "items/:id" => "public/items#show"
  get "customers" => "public/customers#show", as: "customer_show"
  patch "customers/unsubscribe" => "public/customers#unsubscribe"
  #get "customers/edit" => "public/customers#edit"
  get "customers/information/edit" => "public/customers#edit", as: "customer_edit"
  patch "customers/information" => "public/customers#update", as: "customer_update"
  get "customers/unsubscribe/confirm" => "public/customers#confirm"
  get "cart_items" => "public/cart_items#index"
  post "cart_items" => "public/cart_items#create"
  patch "cart_items/:id" => "public/cart_items#update"
  delete "cart_items/:id" => "public/cart_items#destroy", as: "cart_items_destroy"
  #get "orders/new" => "public/orders#new"
  #post "orders/confirm" => "public/orders#confirm"
  #get "orders/complete" => "public/orders#complete"
  #get "orders/index" => "public/orders#index"
  #get "orders/:id" => "public/orders#show"
  #get "addresses" => "public/addresses#index"
  #get "addresses/:id/edit" => "public/addresses#edit", as: "edit_addresses"
  #post  "addresses" => "public/addresses#create"
  patch "addresses/:id" => "public/addresses#update"
  #delete "addresses/:id" => "public/addresses#destroy", as: "destroy_address"

  # 管理者用
  # URL /admin/sign_in ...

  namespace :admin do
    get "/" => "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
