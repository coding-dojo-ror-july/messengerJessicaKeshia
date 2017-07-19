class MessagesController < ApplicationController
    def inbox
        @user = User.find(session[:user_id])
        @received_messages = @user.received_messages
        render 'inbox'
    end  
    def outbox
        @user = User.find(session[:user_id])
        @sent_messages = @user.sent_messages
        render 'outbox'
    end      
    def new
        @users = User.all
        render 'new'
    end   
    def create
        message = Message.new(content:params[:content], to_user:User.find(params[:to_user]), from_user:User.find(params[:from_user]))
        if message.save
            redirect_to '/messages/show/outbox'  
        else
            flash[:errors] = message.errors.full_messages
            redirect_to '/messages/new'
        end
    end               
end
