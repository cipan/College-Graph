CollegeChart::Application.routes.draw do
  get "pages/graph"
  root :to => 'pages#graph'
end
