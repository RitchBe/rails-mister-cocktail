Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:show, :new, :create, :index] do
    resources :doses, only: [:create, :new]
  end
  delete "/doses/:id", to: "doses#destroy"
end