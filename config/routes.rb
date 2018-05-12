Rails.application.routes.draw do
  get "weathers", to: "weathers#index", as: "weathers"

  get "weather/:city", to: "weathers#show", as: "weather"
  post "weather/:city", to: "weathers#create"

  root to: "weathers#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
