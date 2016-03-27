class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.destinations.count == 1
        redirect_to destination_path(current_user.destinations.first)
      else
        redirect_to destinations_path
      end
    end
  end
end
