Rails.application.routes.draw do
  namespace :api do
    post 'users/create'
    post 'products/create'
  end
  post 'api/bookings/create', to: "api/bookings#create"
end
