Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :users, only: %i[create]
      resources :authentications, only: %i[create]
      resources :all_restaurants, only: %i[index show]
      resources :collections
      resources :friends
    end
  end  
end
