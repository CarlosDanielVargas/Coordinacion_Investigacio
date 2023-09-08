Rails.application.routes.draw do
  # Minutes
  resources :minutes do
    collection do
      match 'search' => 'minutes#search', via: [:get, :post], as: :search
    end
  end

  # Requests
  resources :requests

  # Projects
  resources :projects

  # Root path route ("/")
  root "pages#home"

  # Devise routes
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }

  # Individuals
  resources :individuals do
    collection do
      match 'search' => 'individuals#search', via: [:get, :post], as: :search
    end
  end
end
