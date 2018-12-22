Rails.application.routes.draw do
  resources :posts, defauls: {format: :json}
  resources :usuarios, as: :users, only: [:show, :update]
  devise_for :users
  authenticated :user do
    root "init#authenticated"
  end
  unauthenticated :user do
    root "init#unauthenticated"
  end
end
