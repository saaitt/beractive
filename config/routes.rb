Rails.application.routes.draw do
  get 'happenings', to: "happenings#index"


  namespace :api do
    namespace :v1 do
      get 'happenings', to: "happenings#list"
    end
  end
  
end
