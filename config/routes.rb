Rails.application.routes.draw do
  devise_for :users
  root "properties#index"
  
  get "up" => "rails/health#show", as: :rails_health_check

  resources :properties do
    collection do
      delete :bulk_delete
    end
  end

  resources :wishlists, only: [:create, :destroy]

  delete "/wishlists/:property_id", to: "wishlists#destroy"

  get "/wishlist_count", to: "wishlists#count"
  get "/my_wishlist",
to: "wishlists#index"

end
