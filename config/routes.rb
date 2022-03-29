Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  get '/staff_members', to: 'staff_members#index'
  get '/schools/:id', to: 'schools#show'
  get '/schools/:id/edit', to: 'schools#edit'
  get '/staff_members/:id', to: 'staff_members#show'
  get '/staff_members/:id/edit', to: 'staff_members#edit'
  get '/schools/:id/staff_members', to: 'school_staff_members#index'
  get '/schools/:id/staff_members/new', to: 'school_staff_members#new'
  post '/schools', to: 'schools#create'
  post '/schools/:id/staff_members', to: 'school_staff_members#create'
  patch '/schools/:id', to: 'schools#update'

end
