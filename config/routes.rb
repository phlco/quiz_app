CapybaraApp::Application.routes.draw do

  root to: 'welcome#index'
  get '/javascript' => 'javascript#index'
  get '/quizzes' => 'quizzes#index'
end
