Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
    member do 
      get "like", to: "posts#upvote"
      get "dislike", to: "posts#downvote"
    end
  end
  root 'posts#index'
end
