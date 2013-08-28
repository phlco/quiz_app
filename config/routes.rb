CapybaraApp::Application.routes.draw do
  root to: 'welcome#index'
  get '/javascript' => 'welcome#compsci'
  get '/quizzes' => 'welcome#calc'
end
