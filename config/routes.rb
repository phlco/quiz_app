CapybaraApp::Application.routes.draw do
  root to: 'main#index'
  get '/javascript', to: 'main#javascript'

end
