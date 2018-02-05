class HostsController < ApplicationController

    def show
       @host = current_host
    end

    def new
        @host = Host.new
    end

    def create
        @host = Host.new(host_params)

        if @host.save
            flash[:success] = "Welcome to GameTable, #{@host.name}!"
            session[:host_id] = @host.id
            redirect_to dashboard_path
        else
            flash[:danger] = "We're sorry, but something went wrong."
            render :new
        end
    end

    def edit
       @host = current_host
    end

    def update
        @host = current_host

        if @host.update_attributes(host_params)
            flash[:success] = "Your information has been updated"
            redirect_to root_path
        else
            flash[:danger] = "Sorry, something went wrong"
            render :edit
        end
    end

    private

    def host_params
        params.require(:host).permit(:name, :address, :phone, :email, :password, :password_confirmation)
    end
end
