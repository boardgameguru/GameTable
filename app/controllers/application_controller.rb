class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    helper_method :current_user
    helper_method :current_host

    def current_user
        session[:user_id] && User.find(session[:user_id])
    end

    def current_host
       session[:host_id] && Host.find(session[:host_id])
    end
end
