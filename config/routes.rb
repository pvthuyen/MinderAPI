Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles do
  	get 'matches', to: 'profiles#matches'
    post 'edit_travel_info', to:'profiles#edit_travel_info'
  end
end
