Rails.application.routes.draw do
  resources :profiles, except: [:edit, :update]
  resources :quiz_attempts, except: :show
  resources :tags
  resources :question_answers, except: :create
  resources :questions
  resources :answers
  resources :videos
  resources :quizzes
  devise_for :users, controllers: { registrations: "registrations" }
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end
  root 'home#index'
  get '/results' => 'certificate_attempts#show'
  get '/profile' => 'profiles#edit'
  get '/checkout' => 'home#checkout', as: :checkout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  defaults format: :json do
    get 'quiz_attempts/current'
    post 'question_answers' => 'question_answers#create'
    get 'attempts/new' => 'certificate_attempts#new'
    post 'attempts/new' => 'certificate_attempts#new'
    put 'profiles/:id' => 'profiles#update'
  end
end
