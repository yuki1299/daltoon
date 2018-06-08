Rails.application.routes.draw do
  mount_devise_token_auth_for 'Professor', at: 'auth'
  devise_for :teachers
	root :to => "login#index"

  namespace :teacher, as: :professor  do
    get 'login-professor'       => "teacher_login#index", as: :login_teacher
    get 'cadastro'              => "register#index", as: :register_teacher
    get '/:id/estudantes-resultados' => "students_results#index", as: :students_results
  end

  resources :teachers  do
    resources :classrooms do
      get '/students'            , to: 'students#index'
      get '/students/:student_id', to: 'students#show'
    end
  end

  get ':student_id/questions-1'  => 'questions#one'
  get ':student_id/questions-2'  => 'questions#two'
  get ':student_id/questions-3'  => 'questions#three'
  get ':student_id/questions-4'  => 'questions#four'
  get ':student_id/questions-5'  => 'questions#five'
  get ':student_id/questions-6'  => 'questions#six'
  get ':student_id/questions-7'  => 'questions#seven'
  get ':student_id/questions-8'  => 'questions#eight'
  get ':student_id/questions-9'  => 'questions#nine'
  get ':student_id/questions-10' => 'questions#ten'
  get ':student_id/questions-11' => 'questions#eleven'
  get ':student_id/send_question' => 'questions#send_question'

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
