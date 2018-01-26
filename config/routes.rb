Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'welcome#index'

    get '/dashboard' => 'dashboard#index'

    resource :hosts
    resources :tables
    resource :users
    resource :sessions, only: %i(new create destroy)

    post 'tables/:table_id' => 'tables#reservation'
end
