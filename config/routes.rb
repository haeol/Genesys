Rails.application.routes.draw do
	devise_for :users, controllers: { sessions: 'users/sessions' }


	#resources :pages do
	#	get "*page" => "pages#show"
	#end
	resources :dashboard, :only => [:index]

	get "/pages/*page" => "pages#show"

	root "pages#show", page: "home"

end
