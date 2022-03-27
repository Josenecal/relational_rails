Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/schools', to: 'schools#index'
  get '/staff_members', to: 'staff_members#index'
  get '/schools/:id', to: 'schools#show'
  get '/staff_members/:id', to: 'staff_members#show'
end
