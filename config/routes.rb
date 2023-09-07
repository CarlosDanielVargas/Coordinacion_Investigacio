Rails.application.routes.draw do
  resources :minutes do
    collection do
      match 'search' => 'minutes#search', via: [:get, :post], as: :search
    end
  end
  resources :projects
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }

  resources :individuals do
    collection do
      match 'search' => 'individuals#search', via: [:get, :post], as: :search
    end
  end
end
