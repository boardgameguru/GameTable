class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    helper_method :current_user
    helper_method :current_host

    private

    def current_user
        session[:user_id] && User.find(session[:user_id])
    end

    def current_host
       session[:host_id] && Host.find(session[:host_id])
    end

    def require_login
        unless current_user || current_host
            flash[:error] = "Please log in first"
            redirect_to new_sessions_path
        end
    end
end
