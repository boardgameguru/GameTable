class HostsController < ApplicationController

    def new
        @host = Host.new
    end

    def create
        @host = Host.new(host_params)

        if @host.save
            flash[:notice] = "Welcome to GameTable, #{@host.name}!"
            session[:host_id] = @host.id
            redirect_to root_path
        else
            flash[:alert] = "We're sorry, but something went wrong."
            render :new
        end
    end

    private

    def host_params
        params.require(:host).permit(:name, :address, :phone, :email, :password, :password_confirmation)
    end
end
