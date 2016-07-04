class BillythoughtsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def create
        @billythought = current_user.billythoughts.build(billythought_params)
        if @billythought.save
            flash[:success] = "Billythought created"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
    end

    def destroy
    end

    def doodooblast
        @billythought = Billythought.find(params[:id])
        @billythought.increment!(:doodooblasts, by = 1) 
        redirect_back_or root_url
    end

    def namaste
        @billythought = Billythought.find(params[:id])
        @billythought.increment!(:namastes, by = 1)
        redirect_back_or root_url
    end

    private

    def billythought_params
        params.require(:billythought).permit(:content)
    end
end
