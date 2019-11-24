Rails.application.routes.draw do
  resources :quiz_attempts
  resources :tags
  resources :question_answers
  resources :questions
  resources :answers
  resources :videos
  resources :quizzes
  devise_for :users
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
