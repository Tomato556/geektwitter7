class LovesController < ApplicationController

    def create
        love = current_user.loves.create(relax_id: params[:relax_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        love = Love.find_by(relax_id: params[:relax_id], user_id: current_user.id)
        love.destroy
        redirect_back(fallback_location: root_path)
    end

end
