Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/tours', to: 'tours#index'
  get '/tours/new', to: 'tours#new'
  post '/tours', to: 'tours#create'
end
