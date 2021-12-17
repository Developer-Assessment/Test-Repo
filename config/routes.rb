Rails.application.routes.draw do
  post 'api/bookings/create', to: "api/bookings#create"
end
