class UsersController < ApplicationController
    def new
      @users = User.new
    end
  
    def index
      @user = User.all
    end
  
    def create
      @user = User.new(user_params)
      @user.save
      flash[:notice] = 'User created, make your login'
      redirect_to new_session_path
    end
  
    def show
      @user = User.find(params[:id])
      @upcoming_events = @user.created_events.upcoming
      @previous_events = @user.created_events.past
    end
  
    private

    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:username)
    end
    
  end