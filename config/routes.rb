Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  post '/products/:id', to: 'payments#create'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]
  resources :products do
    resources :comments
  end

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  post 'static_pages/thank_you'


  root 'static_pages#landing_page'
  #root 'static_pages#landing_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
