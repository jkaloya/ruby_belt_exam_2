class IdeasController < ApplicationController
    before_action :require_login, only: [:index, :create, :destroy]
    def index
        @user = current_user
        @ideas = Idea.all
        @likes = Like.all
    end

    def create
        @user = current_user
        @idea = @user.ideas.create( ideas_params )
        if @idea.save
            redirect_to "/bright_ideas"
        else
            flash[:errors] = []
            flash[:errors] = @user.errors.full_messages
            redirect_to "/bright_ideas"
        end
    end

    def show
        @idea = Idea.find( params[:id] )
        @likes = @idea.likes
    end

    def destroy
        idea = Idea.find( params[:id] )
        idea.destroy if idea.user == current_user
        redirect_to "/bright_ideas"
    end

    private
    def ideas_params
        params.require(:idea).permit(:content, :user_id)
    end
end
