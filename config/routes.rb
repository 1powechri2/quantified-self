Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      get '/foods', to: 'foods#index'
      post '/foods', to: 'foods#create'
      get '/foods/:id', to: 'foods#show'
    end
  end
end
