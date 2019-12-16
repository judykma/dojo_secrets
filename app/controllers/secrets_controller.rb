class SecretsController < ApplicationController
    def index
        @secrets = Secret.all.includes(likes: :user)
        @like = Like.all
        @user = current_user
        if !session[:user_id]
            redirect_to "/sessions/new"
        end
    end
    def create
        @secret = Secret.new(secret_params)
        @user = current_user
        if @secret.valid?
            @secret.save
            redirect_to '/users/' + @secret.user.id.to_s
        else
            redirect_to '/users/' + @secret.user.id.to_s, alert: @secret.errors.full_messages
        end
    end
    def destroy #deletes secret
        # puts current_user.id
        secret = Secret.find(params[:id])
        # puts secret.user.id
        secret.destroy
        redirect_to "/users/" + current_user.id.to_s
    end

    private
    def secret_params
        params.require(:secret).permit(:content).merge(user: current_user)
    end
end
