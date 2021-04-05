class UsersController < ApplicationController
    def new
      @users = User.new
    end
  
    def index
      @user = @current_user.achievements
    end
  
    def create
      @user = User.new(user_params)
      @user.save
      flash[:notice] = 'User created, make your login'
      redirect_to new_session_path
    end
  
    def show
      @user = User.find(params[:id])
      # @upcoming_events = @user.attended_events.upcoming_events
      # @previous_events = @user.attended_events.previous_events
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username)
    end
    
  end