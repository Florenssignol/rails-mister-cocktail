Rails.application.routes.draw do
 resources :cocktails, only: [ :index, :show, :new, :create, :destroy ] do
  resources :doses, only: [ :new, :create, :destroy ]
 end

 root to: "cocktails#index"

end
