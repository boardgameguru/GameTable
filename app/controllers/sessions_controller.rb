class SessionsController < ApplicationController
  def new
        if current_user()
            flash[:notice] = "You're already logged in"
            redirect_to root_path
        end
  end

    def create
      user = User.find_by email: session_params[:email]

      if user && user.authenticate(session_params[:password])
          flash[:notice] = "Successfuly logged in!"
          session[:user_id] = user.id
          redirect_to root_path
      else
          flash[:alert] = "Invalid credentials"
          render :new
      end
    end

  def destroy
      session.delete(:user_id)
      flash[:notice] = "Logged out successfully"
      redirect_to root_path
  end

    private

    def session_params
       params.require(:session).permit(:email, :password)
    end

end
