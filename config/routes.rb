Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'post_images#index'

  # 画像投稿用コントローラのアクションに対するルーティングを行う
  # コメント投稿コントローラは画像投稿コントローラと親子関係になる
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :post_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]
  
end
