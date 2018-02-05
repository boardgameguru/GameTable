class TablesController < ApplicationController

    def index
       @tables = Table.all
    end

    def new
       @table = Table.new
    end

    def create
        @table = Table.new(table_params)
        @table.host_id = current_host.id

        if @table.save
            flash[:success] = "Your table has been created!"
            redirect_to dashboard_path
        else
            flash[:danger] = "Sorry, something went wrong"
            render :new
        end
    end

    def reservation
        @table = Table.find(params[:table_id])

        if @table.users << current_user
            flash[:success] = "You have been registered"
            redirect_to dashboard_path
        else
            flash[:danger] = "Sorry, something went wrong. Please try again."
            redirect_to action: "index"
        end
    end

    private

    def table_params
        params.require(:table).permit(:table_name, :table_date, :table_time, :number_of_seats)
    end
end
