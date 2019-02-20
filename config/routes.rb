Rails.application.routes.draw do
  root to: 'pages#home'

  get 'test',  to: 'pages#test'

  namespace 'api',  defaults: { format: :json } do
    namespace 'v1' do
      resources :todos
    end
  end
end
