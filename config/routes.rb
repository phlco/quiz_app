CapybaraApp::Application.routes.draw do
  root :to => "welcome#index"
  get '/javascript' => "welcome#javascript", as: 'javascript'
  get '/quizzes' => "welcome#quizzes", as: 'quizzes'
end
