Rails.application.routes.draw do

  #temporaly
  get 'spry', to: 'pages#spry'
  #temporaly

  root 'pages#index'

  resources :books
  #get 'books/:id/destroy', to: 'books#destroy', as: 'book_destroy'
  get 'catalog', to: 'books#catalog'
  get 'books(/catid/:catid)(/order/:order)', to: 'books#index'

  #order_items
  resources :order_items, except: [:edit, :show]
  post 'change_order_item/(:id)/(:quantity)', to: 'order_items#update', as: 'change_order_item'

  post 'to_cart/(:item_id)/(:quantity)', to: 'order_items#create', as: 'to_cart'

  #post 'clear_cart', to: 'orders#clear_cart', as: 'clear_cart'
  get 'cart', to: 'orders#index', as: 'cart_page'

  #profile
  get 'users/profile'


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  #get 'book/show', to: 'books#show', as: 'show_book'
  #get 'books/new'

  #get 'books/create'

  #get 'books/edit(/:id)(/.:format)', to: 'books#edit', as: 'book_delete'

  #get 'books/update'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #get 'pages/index'
end
