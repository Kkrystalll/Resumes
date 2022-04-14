Rails.application.routes.draw do
  resources :resumes
  
  resource :users, only: [:create] do
    get :sign_up
    get :sign_in
  end

  resources :sessions, only: [:create, :destroy]
  # get "users/sign_up", to: "users#new"
  
  # get "/resumes", to: "resumes#index"
  # get "/resumes/new", to: "resumes#new", as:"new_resumes"
  # post "/resumes", to: "resumes#create"
  # get "resumes/:id", to: "resumes#show", as:"resume"
  # delete "resumes/:id", to: "resumes#destroy"
  # get "resumes/:id/edit", to: "resumes#edit", as:"edit_resume"
  # patch "resumes/:id", to: "resumes#update"
  # post "/", to: "pages#index"
  root "resumes#index"
end
