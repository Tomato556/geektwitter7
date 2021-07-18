Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :users, only: [:show]

get 'relaxes' => 'relaxes#cards'
get 'relaxes/cards' => 'relaxes#cards'
get 'tasks/tomato' => 'tasks#tomato'
get 'tasks/hiyo' => 'tasks#hiyo'
root 'tasks#tomato'

  resources :tasks do
    resources :likes, only: [:create, :destroy]
  end

  resources :relaxes do
    resources :loves, only: [:create, :destroy]
    resources :comments, only: [:create]
  end


end
