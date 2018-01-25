class TablesController < ApplicationController

    def new
       @table = Table.new
    end

    def create
        @table = Table.new(table_params)
        @table.host_id = current_host.id

        if @table.save
            flash[:notice] = "Your table has been created!"
            redirect_to dashboard_path
        else
            flash[:alert] = "Sorry, something went wrong"
            render :new
        end
    end

    private

    def table_params
        params.require(:table).permit(:table_name, :table_date, :table_time, :number_of_seats)
    end
end
