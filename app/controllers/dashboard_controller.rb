class DashboardController < ApplicationController
    before_action :require_login

    def index
        if current_user

        elsif current_host
           @main = Table.where(host_id: current_host.id)
        end
    end
end
