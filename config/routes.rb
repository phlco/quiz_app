CapybaraApp::Application.routes.draw do
  root to: 'welcome#index'
  get '/javascript' => 'javascript#index'
  get '/quizzes' => 'quiz#index'
end
