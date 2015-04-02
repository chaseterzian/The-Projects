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
  # resources :tracker_stories, only: [:show, :index]


  get '/tracker_stories/:project_id' => 'projects#tracker_stories', as: :tracker_stories
  # resources :tracker_stories, only: [:index, :show]
  resources :users
  resources :projects do
    resources :memberships
    resources :tasks  do
      resources :comments, only: [:create]
    end
  end

end
