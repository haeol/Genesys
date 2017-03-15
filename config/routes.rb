Rails.application.routes.draw do
	devise_for :users, controllers: { sessions: 'users/sessions' }
	get "/pages/*page" => "pages#show"
  get "dashboard" => "tab#dashboard"

	root "pages#show", page: "home"

end
