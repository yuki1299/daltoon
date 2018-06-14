Rails.application.routes.draw do
  mount_devise_token_auth_for 'Professor', at: 'auth'
  devise_for :teachers
	root :to => "login#index"

  namespace :teacher, as: :professor  do
    get 'login-professor'       => "teacher_login#index", as: :login_teacher
    get 'cadastro'              => "register#index", as: :register_teacher
    post 'new'              => "register#create", as: :register_teacher_post
    get '/:id/estudantes-resultados' => "students_results#index", as: :students_results
  end

  resources :teachers  do
    resources :classrooms do
      get '/students'            , to: 'students#index'
      get '/students/:student_id', to: 'students#show', as: :student_show
    end
  end

  get '/student/:student_id/questions-1'  => 'questions#one', as: :questions_one
  get '/student/:student_id/questions-2'  => 'questions#two', as: :questions_two
  get '/student/:student_id/questions-2-1'  => 'questions#two_one', as: :questions_two_one

  get '/student/:student_id/questions-3'  => 'questions#three', as: :questions_three
  get '/student/:student_id/questions-3-1'  => 'questions#three_one', as: :questions_three_one

  get '/student/:student_id/questions-4'  => 'questions#four', as: :questions_four
  get '/student/:student_id/questions-4-1'  => 'questions#four_one', as: :questions_four_one

  get '/student/:student_id/questions-5'  => 'questions#five', as: :questions_five
  get '/student/:student_id/questions-6'  => 'questions#six', as: :questions_six
  get '/student/:student_id/questions-6-1'  => 'questions#six_one', as: :questions_six_one

  get '/student/:student_id/questions-7'  => 'questions#seven', as: :questions_seven
  get '/student/:student_id/questions-7-1'  => 'questions#seven_one', as: :questions_seven_one
  
  get '/student/:student_id/questions-8'  => 'questions#eight', as: :questions_eight
  get '/student/:student_id/questions-9'  => 'questions#nine', as: :questions_nine
  get '/student/:student_id/questions-10' => 'questions#ten', as: :questions_ten
  get '/student/:student_id/questions-11' => 'questions#eleven', as: :questions_eleven
  get '/finish_test' => 'questions#finish_test', as: :finish_test_student

  namespace :api do
  	namespace :v1 do
      get '/send_answer', to: 'questions#answer'
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
