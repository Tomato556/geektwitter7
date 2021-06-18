class TasksController < ApplicationController

    def index
        if params[:search] == nil
            @tasks= Task.all.page(params[:page]).per(3)
        elsif params[:search] == ''
            @tasks= Task.all.page(params[:page]).per(3)
        else
            #部分検索
            @tasks = Task.where("body LIKE ? ",'%' + params[:search] + '%').page(params[:page]).per(3)
        end
        @task = Task.new
    end

    def new
        @task = Task.new
    end

    def tomato
    end

    def create
        task = Task.new(task_params)
        task.user_id = current_user.id
            if task.save
            redirect_to :action => "index"
            else
            redirect_to :action => "new"
            end
    end

    def show
        @task = Task.find(params[:id])
    end

    def destroy
        task = Task.find(params[:id])
        task.destroy
        redirect_to action: :index
    end

    private

    def task_params
        params.require(:task).permit(:title, :body)
    end

    before_action :authenticate_user!, only: [:destroy, :edit, :update, :create, :new]
end
