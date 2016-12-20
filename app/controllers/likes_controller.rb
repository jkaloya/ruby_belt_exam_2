class LikesController < ApplicationController

    def create
        idea = Idea.find( params[:idea_id] )
        like = Like.create(user: current_user, idea: idea)
        redirect_to "/bright_ideas"
    end

end
