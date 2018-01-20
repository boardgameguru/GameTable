class UsersController < ApplicationController

    def new
        if current_user()
            flash[:notice] = "You're already logged in"
            redirect_to root_path
        else
            @user = User.new
        end
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:notice] = "Successfully signed up!"
            redirect_to root_path
        else
            flash[:alert] = "Please try again. Something went wrong."
            render :new
        end
    end

    private

    def user_params
       params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
