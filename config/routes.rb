Rails.application.routes.draw do
  get "/resumes", to: "resumes#index"
  get "/resumes/new", to: "resumes#new", as:"new_resumes"
  post "/", to: "pages#index"
  post "/resumes", to: "resumes#create"
  root "pages#index"
end
