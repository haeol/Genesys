Rails.application.routes.draw do
	devise_for :users, controllers: { sessions: 'users/sessions' }
	get "/pages/*page" => "pages#show"
	root "pages#show", page: "home"

end