Rails.application.routes.draw do
  get '/', to: redirect('/orders')
  resources :orders
end
