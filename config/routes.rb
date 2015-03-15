Rails.application.routes.draw do

    root 'welcome#index'

    get '/terms' => 'terms#terms'
    get '/about' => 'about#about'
    get '/faq' => 'common_questions#common_questions'

    get '/sign-up' => 'registrations#new', as: :signup
    post '/sign-up' => 'registrations#create'
    get '/sign-in' => 'authentication#new', as: :signin
    post '/sign-in' => 'authentication#create'
    get '/sign-out' => 'authentication#destroy', as: :signout


    #get "/tasks" => "tasks#tasks"

    resources :users
    resources :projects
      resources :tasks
    


end
