Rails.application.routes.draw do

	devise_for :users, controllers: { sessions: 'users/sessions' }


	#resources :pages do
	#	get "*page" => "pages#show"
	#end
  resources :posts do#, :path => 'post'
    resources :comments
  end

	resources :dashboard, :only => [:index]
	
	resources :myprofile, :only => [:index]

	resources :groups, :only => [:index]

	resources :friendships

	resources :tags, :only => [:index]

	
	get "/pages/*page" => "pages#show"

	#root "pages#show", page: "home"
  root "dashboard#index", page: "home"

end
