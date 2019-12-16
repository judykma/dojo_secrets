class LikesController < ApplicationController
    def create
        puts params[:secret_id]
        @like = Like.create(user: User.find(params[:user_id]), secret: Secret.find(params[:secret_id]))
        redirect_to '/secrets'
    end
    def destroy
        puts params[:secret_id]
        @secret = Secret.find_by(id: params[:secret_id])
        @like = Like.find_by(secret: @secret, user: current_user)
    
        puts "!!!!!!!!!!!!!!!!!!"
        puts @like
        
        if current_user == @like.user
            if already_liked
                @like.destroy
                redirect_to '/secrets'
            end
        else
            puts "ERROR unliking"
            redirect_to '/secrets'
        end
    end
    private
    def already_liked
        Like.where(secret: @secret, user: current_user).exist?
    end
end
