class UsersController < ApplicationController

    def new
        if current_user()
            flash[:success] = "You're already logged in"
            redirect_to root_path
        else
            @user = User.new
        end
    end

    def show
       @user = current_user
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:success] = "Successfully signed up!"
            session[:user_id] = @user.id
            redirect_to dashboard_path
        else
            flash[:danger] = "Please try again. Something went wrong."
            render :new
        end
    end

    def edit
        @user = current_user
    end

    def update

        @user = current_user

        if @user.update_attributes(user_params)
            flash[:success] = "Your information has been updated"
            redirect_to root_path
        else
            flash[:danger] = "Sorry, something went wrong"
            render :edit
        end
    end

    private

    def user_params
       params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
