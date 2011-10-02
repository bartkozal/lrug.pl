LrugPl::Application.routes.draw do
  resource :welcome, :only => :show
  resources :events, :only => :index
  resources :presentations, :only => [:edit, :update]
  namespace :admin do
    resources :events, :only => [:index, :create, :destroy]
  end
  get 'admin' => 'admin/events#index', :as => :admin
  root :to => 'welcomes#show'
end
