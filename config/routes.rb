Rails.application.routes.draw do
  mount_devise_token_auth_for 'Professor', at: 'auth'
  devise_for :teachers
	root :to => "login#index"
  get 'cadastro' => "register#index", as: :register

  namespace :api do
  	namespace :v1 do
      post '/send_answer', to: 'questions#answer'
  		resources :classrooms, only: [:index, :show, :create] do
        get '/students'            , to: 'students#index'
        get '/students/:student_id', to: 'students#show'
      end

      resources :sessions, only: [:create, :destroy]

  		resources :students, only: :create do
        resources :answers, only: :create
      end
  	end
  end
end
