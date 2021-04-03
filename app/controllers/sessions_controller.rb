class SessionsController < ApplicationController
    def new
     end
  
    def create
      @user = User.find_by(username: params[:username])
      if @user
        session[:user_id] = @user.id
        session[:username] = @user.username
        flash[:notice] = "Welcome to private events, #{@user.username}!!"
        redirect_to root_path
      else
        flash[:notice] = 'Username not found, register your username'
        redirect_to '/users/new'
      end
    end
  
    def destroy
      session[:user_id] = nil
      flash[:notice] = 'Logged out'
      redirect_to root_path
    end
  end