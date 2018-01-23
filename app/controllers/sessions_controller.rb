class SessionsController < ApplicationController
  def new
        if current_user || current_host
            flash[:notice] = "You're already logged in"
            redirect_to root_path
        end
  end

    def create
        if User.find_by email: session_params[:email]
            user = User.find_by email: session_params[:email]

            if user.authenticate(session_params[:password])
                flash[:notice] = "Successfuly logged in as #{user.first_name} #{}!"
                session[:user_id] = user.id
                redirect_to root_path
            else
                flash[:alert] = "Invalid credentials"
                render :new
            end

        elsif Host.find_by email: session_params[:email]
            host = Host.find_by email: session_params[:email]

            if host.authenticate(session_params[:password])
                flash[:notice] = "Successfuly logged in as #{host.name}!"
                session[:host_id] = host.id
                redirect_to root_path
            else
                flash[:alert] = "Invalid credentials"
                render :new
            end
        end
    end

  def destroy
        if session[:user_id]
            session.delete(:user_id)
            flash[:notice] = "Logged out successfully"
            redirect_to root_path
        elsif
            session.delete(:host_id)
            flash[:notice] = "Logged out successfully"
            redirect_to root_path
        end
  end

    private

    def session_params
       params.require(:session).permit(:email, :password)
    end

end
