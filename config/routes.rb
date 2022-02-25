Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, defaults: { format: :json }, path: 'users',
                     path_names: { sign_in: 'signin', sign_out: 'signout', registration: 'signup' }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :houses, only: %i[index show create destroy]
      resources :reservations, only: %i[index create destroy]
      resources :favorites, only: %i[index create destroy]
    end
  end
end
