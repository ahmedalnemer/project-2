Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/edit/:id', to: 'posts#edit', as: 'posts_edit'
  post 'posts/create'
  patch 'posts/update/:id', to: 'posts#update', as: 'posts_update'
  patch 'posts/like/:id', to: 'posts#like', as: 'posts_like'
  delete 'posts/destroy/:id', to: 'posts#destroy', as: 'posts_destroy'
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
