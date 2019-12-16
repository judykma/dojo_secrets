#THIS IS USED FOR CREATING USERS

class UsersController < ApplicationController
    def new #renders register html

    end

    def create #process of registering/creating the user
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:id] = @user.id
            puts "successfully created a new user"
            redirect_to '/sessions/new'
        else
            flash[:errors] = ["can't be blank"]
            puts "error creating new user"
            redirect_to '/users/new'#, alert: @user.errors.full_messages
        end
    end

    def show #displays logged in user's dashboard
        if !session[:user_id]
            redirect_to "/sessions/new"
        end
        
        @user = User.find_by(id: params[:id])
        # @secrets = @user.secrets.all
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
