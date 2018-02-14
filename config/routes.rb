Rails.application.routes.draw do
  get '/', to: redirect('/orders')
  resources :orders
  post '/shipping', to: 'shipping#show'
end
