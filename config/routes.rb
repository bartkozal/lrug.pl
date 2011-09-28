LrugPl::Application.routes.draw do
  resource :welcome, :only => :show
  resources :events, :only => :index
  root :to => 'welcomes#show'
end
