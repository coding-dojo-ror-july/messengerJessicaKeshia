class UsersController < ApplicationController
        def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/messages/show/inbox'
        else 
            flash[:errors] = user.errors.full_messages
            redirect_to '/'
        end
    end 
    
    def authenticate 
        user = User.find_by(username: params[:username])
        if user.nil?
            flash[:errors] = ['User not found']
            redirect_to '/'
        elsif user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to '/messages/show/inbox'
        else
            flash[:errors] = ['Incorrect password']  
            redirect_to '/'
        end
    end 
    def logout
        reset_session
        redirect_to '/'
    end  
    def show
        @user = User.find(session[:user_id])
        contacts_to = @user.users_sent_to.group(:username)
        contacts_from = @user.users_received_from.group(:username)
        @contacts = (contacts_to + contacts_from).uniq
        render 'contacts'
    end    

    private
        def user_params
            params.require(:user).permit(:username, :password, :password_confirmation)
        end  
end
