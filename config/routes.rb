Rails.application.routes.draw do
    root "welcome#index"
    get "/terms" => "terms#index"
    get "/about" => "about#index"
    get "/faq" => "common_questions#index"
end
