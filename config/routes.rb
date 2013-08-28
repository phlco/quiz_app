CapybaraApp::Application.routes.draw do

root to: "welcome#index"
get '/javascript', to: 'welcome#javascript', as: "javascript"
get 'quizzes', to: 'welcome#quizzes', as: "quizzes"

end
