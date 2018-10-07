Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      get '/foods', to: 'foods#index'
      post '/foods', to: 'foods#create'
      get '/foods/:id', to: 'foods#show'
      patch '/foods/:id', to: 'foods#update'
      delete '/foods/:id', to: 'foods#destroy'
      get '/meals', to: 'meals#index'
      get '/meals/:id/foods', to: 'meals#show'
      post '/meals/:meal_id/foods/:id', to: 'meals#create'
      delete '/meals/:meal_id/foods/:id', to: 'meals#delete'
    end
  end
end
