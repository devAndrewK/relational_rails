Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/tours', to: 'tours#index'
  get '/tours/new', to: 'tours#new'
  post '/tours', to: 'tours#create'
  get '/tours/:id', to: 'tours#show'
  get '/venues', to: 'venues#index'
  get '/venues/:id', to: 'venues#show'
  get '/tours/:tour_id/venues', to: 'tour_venues#index'
  delete '/tours/:id', to: 'tours#destroy'
  get '/tours/:tour_id/edit', to: 'tours#edit'
  patch '/tours/:id', to: 'tours#update'
  get '/tours/:tour_id/venues/new', to: 'tour_venues#new'
  post '/tours/:tour_id/venues', to: 'tour_venues#create'
  get '/venues/:id/edit', to: 'venues#edit'
  patch '/venues/:id', to: 'venues#update'
end
