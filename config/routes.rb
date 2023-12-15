Rails.application.routes.draw do


  post 'timeout_end',  to: 'parking_transactions#timeout_end'
  get 'timeout',  to: 'parking_transactions#timeout'
  get 'timeout_trans',  to: 'parking_transactions#timeout_trans'
  resources :parking_lot_statuses
  resources :parking_blocks
  resources :parking_levels
  resources :parking_lot_dtls
  resources :parking_lot_hdrs
  resources :parking_transactions
  resources :parking_settings
  resources :parking_vehicle_types
  resources :parking_vehicles
  resources :parking_entrances
  resources :parking_spaces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
