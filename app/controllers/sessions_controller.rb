#THIS IS USED FOR STARTING A SESSION/LOGGING IN EXISTING USERS
class SessionsController < ApplicationController
    def new
        if session[:user_id]
            redirect_to "/users/" + current_user.id.to_s
        end
    end
    def create #start a session for the logged in user
        @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
        if @user
            puts "User successfully logged in"
            session[:user_id] = @user.id
            redirect_to "/users/" + @user.id.to_s
        else 
            puts "!!!!! Error logging in user !!!!!"
            flash[:errors] = ["Email and/or password is incorrect"]
            redirect_to "/sessions/new"
        end
    end
    def destroy
        session[:user_id] = nil
        redirect_to "/sessions/new"
    end
end
