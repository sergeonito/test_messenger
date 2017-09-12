Rails.application.routes.draw do
  root 'welcome#index'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # SignIn/SignUp/SignOut
  get '/sign-up' => 'registrations#new', as: :signup
  post '/sign-up' => 'registrations#create'
  get '/sign-in' => 'authentication#new', as: :signin
  post '/sign-in' => 'authentication#create'
  get '/sign-out' => 'authentication#destroy', as: :signout

  resources :conversations do
    resources :messages
  end
end
