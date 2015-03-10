Rails.application.routes.draw do

    root 'welcome#index'

    get '/terms' => 'terms#terms'
    get '/about' => 'about#about'
    get '/faq' => 'common_questions#common_questions'
    get '/sign-up' => 'registrations#new', as: :signup
    post '/sign-up' => 'registrations#create'
    

    #get "/tasks" => "tasks#tasks"

    resources :tasks
    resources :users
    resources :projects
end
