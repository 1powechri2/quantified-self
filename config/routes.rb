Rails.application.routes.draw do
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      get '/foods', to: 'foods#index'
      get '/foods/:id', to: 'foods#show'
    end
  end
end
