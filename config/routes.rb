Rails.application.routes.draw do

	devise_for :users, controllers: { sessions: 'users/sessions' }


	#resources :pages do
	#	get "*page" => "pages#show"
	#end
  resources :posts#, :path => 'post'

	resources :dashboard, :only => [:index]
	
	resources :myprofile, :only => [:index]

	resources :groups, :only => [:index]

	resources :friends, :only => [:index]

	
	get "/pages/*page" => "pages#show"

	root "pages#show", page: "home"

end
