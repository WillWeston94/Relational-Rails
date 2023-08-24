Rails.application.routes.draw do
 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: "academic#index"
  get '/faculties', to: "faculties#index"
  get "/faculties/new", to: "faculties#new", as: 'new_faculty'
  post "/faculties", to: "faculties#create" 
  get '/faculties/:id', to: "faculties#show"
  get '/courses', to: "courses#index"
  get '/courses/:id', to: "courses#show"
  get '/faculties/:id/courses', to: "courses#show"
  get '/faculties/:faculty_id/courses', to: 'courses#index', as: 'faculty_courses'
end
