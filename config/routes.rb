Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users, :only => [:new, :create]
  resources :about, only: [:index]
  resources :recipes
  get '/my/recipes' => 'recipes#my_recipes'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  post '/recipes/add/:recipe_id' => 'recipes#add', :as => "add_recipe"
end
