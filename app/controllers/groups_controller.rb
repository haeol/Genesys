class GroupsController < ApplicationController
    def show
      if valid_page?
	render template: "groups/#{params[:page]}"
      else
        render file: "public/404.html", status: :not_found
      end
    end

    private
    def valid_page?
      File.exist?(Pathname.new(Rails.root + "app/views/groups/#{params[:page]}.html.erb"))
    end
end
