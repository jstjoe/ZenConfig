SampleApp::Application.routes.draw do
  root  'static_pages#home'

  resources :users
  resources :sessions
  resources :accounts
  resources :tickets
  
  get "tickets/sync"
  get "tickets/import"
  get "tickets/migrate"

  get 'accounts/:id/select' => 'accounts#select'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
end
