Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :projects, only: :index
  end
  
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :projects do
      resources :milestones
      resources :viewers
    end
  end

  post 'signin', to: 'authentication#authentication'
  post 'signup', to: 'users#create'
end
