Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :books
      resources :author
    end
  end

  post 'authenticate', to: 'authentication#authenticate'

end
