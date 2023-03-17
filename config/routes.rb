Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: [:index, :show] do
    get :history
    put :update_status
    post :create_comment
  end
end
