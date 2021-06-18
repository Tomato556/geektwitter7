class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])

    end
    

    before_action :authenticate_user!
end
