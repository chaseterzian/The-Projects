Rails.application.routes.draw do
    root "welcome#index"
    get "/terms" => "terms#terms"
    get "/about" => "about#about"
    get "/faq" => "common_questions#common_questions"
    get "/tasks" => "tasks#tasks"
end
