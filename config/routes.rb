Rails.application.routes.draw do
  post 'api/bookings/create', to: "api/bookings#create"
  get 'api/bookings/index', to: "api/bookings#index"
end
