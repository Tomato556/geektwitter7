class RelaxesController < ApplicationController

    def index
        if params[:search] == nil
            @relaxes= Relax.all.page(params[:page]).per(3)
        elsif params[:search] == ''
            @relaxes= Relax.all.page(params[:page]).per(3)
        else
            #部分検索
            @relaxes = Relax.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
            
        end
        @relax = Relax.new
    end

    def new
        @relax = Relax.new
    end

    def create
        relax = Relax.new(relax_params)
        relax.user_id = current_user.id
            if relax.save
            redirect_to :action => "index"
            else
            redirect_to :action => "new"
            end
    end

    def show
        @relax = Relax.find(params[:id])
        @comments = @relax.comments
        @comment = Comment.new
    end

    def edit
        @relax = Relax.find(params[:id])
    end

    def update
        relax = Relax.find(params[:id])
        if relax.update(relax_params)
            redirect_to :action => "show", :id => relax.id
        else
            redirect_to :action => "new"
        end
    end


    def destroy
        relax = Relax.find(params[:id])
        relax.destroy
        redirect_to action: :index
    end

    private

    def relax_params
        params.require(:relax).permit(:title, :body, :image)
    end

    before_action :authenticate_user!, only: [:destroy, :edit, :update, :create, :new, :show]
end

