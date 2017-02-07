Rails.application.routes.draw do
  root 'products#index'
  devise_for :users
  namespace :admin do
   resources :products
 end

 resources :cart_items
 resources :orders

 resources :products do
     member do
       post :add_to_cart
     end
  end

  resources :carts do
      collection do
        delete :clean
      end
    end

  resources :carts do
    collection do
      post :checkout
    end
  end

  namespace :account do
     resources :orders
  end
end
