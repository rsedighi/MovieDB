MovieDB::Application.routes.draw do
  get 'home/index'
  get 'search/index'
  match 'search' => 'search#index', via: :all
  resources :person
  resources :movies

  root 'home#index'

end
